class App.Legend

  constructor: (@template, @element) ->

  render: (data) ->
    source = $(@template).html()
    resultTemplate = Handlebars.compile(source)
    html = resultTemplate(data)
    $(@element).html html

class App.Visualization
  constructor: (@width, @height, @element) ->
    @radius = Math.min(@width, @height) / 2
    @color = d3.scale.category20()
    @pie = d3.layout.pie().sort(null).value((d) ->
      d.value
    )
    @num = 0
    @indicatorsSelected = []
    @statesSelected = []
    @stateList = []
    @filterStateList = []
    @filterStateAndIndicatorsList = []

  wrapperCharsToNumber: (row) ->
    for prop of row
      row[prop] = +row[prop] if prop != 'name'
    row

  renderLegend: ->
    lista = ({color:@color(indicator),name:indicator} for indicator in @color.domain())
    (if row.name in @indicatorsSelected then row.checked = "checked" else row.checked = "" )  for row in lista
    legend = new App.Legend("#legend-table-template","#legend")
    legend.render(lista)

  transformRowToState: (row) ->
      new App.State(row)

  getData: () ->
    d3.csv $("#data_url").val(), @wrapperCharsToNumber, (error, data) =>
      if error 
        throw error
      @stateList = (@transformRowToState(state) for state in data)
      @filterStateAndIndicators()
      @draw()
      return

  calculateFactor: (state) =>
    counter = 0
    avg = 0.0
    avg += indicator.value for indicator in state.indicators
    (counter += 1 if indicator.value > 0) for indicator in state.indicators
    avg = ((Math.round(avg * 10) / 10 ) / (counter))
    avg = Math.round(avg * 10) / 10 
    50 - (avg*40)

  draw: -> 
    @filterStateAndIndicatorsList.forEach (state, index) =>
      factor = @calculateFactor(state)
      @arc = d3.svg.arc().outerRadius(@radius - factor).innerRadius(@radius - 50)
      svg = d3.select(@element).append('svg').attr('width', @width).attr('height', @height).append('g').attr('transform', 'translate(' + @width / 2 + ',' + @height / 2 + ')')
      path = svg.datum(state.indicators).selectAll('path').data(@pie).enter().append('path').attr('fill', (d) =>
        @color d.data.name
      ).attr('d', @arc).each (d) => 
        @current = d 
      svg.append("text").attr("x", 0).attr("y", 62)
      .style("text-anchor", "middle").text(state.name)
      @filterStateList[index].svg = svg
      return
    @renderLegend()
    @bindEvents()

  updateDraw: =>
    @filterStateAndIndicatorsList.forEach (state) =>
      factor = @calculateFactor(state)
      @arc = d3.svg.arc().outerRadius(@radius - factor).innerRadius(@radius - 50)
      indicators = ( new App.Indicator(indicator.name, indicator.value)  for indicator in state.indicators)
      state.svg.datum(indicators).selectAll('path')
      .data(@pie)
      #.transition().duration(750).attrTween("d", @arcTween)
      .attr('d', @arc)
      return

  arcTween: (a) =>
    i = d3.interpolate(@current, a)
    @current = i(0)
    (t) =>
      @arc i(t)

  bindEvents: ->
    $('input[type="checkbox"]').on('change', @filterIndicators)

  lookUpChanges: =>
    @indicatorsSelected = []
    $('input[type="checkbox"]').each (index, element) =>
      if $(element).is(':checked')
        @indicatorsSelected += $(element).attr('name') + ','
      return
    if @indicatorsSelected.length > 0
      @indicatorsSelected = @indicatorsSelected.split ","
    else
      @indicatorsSelected = ["Vivienda", "Ingresos", "Empleos", "Comunidad", "Educación", "Entorno", "Compromiso civil", "Salud", "Satisfacción de vida", "Seguridad", "Equilibrio trabajo-vida", ""]
    @indicatorsSelected.pop()

  filterIndicators: =>
    @lookUpChanges()
    @filterStateAndIndicatorsList = []
    newList = ($.extend({}, state) for state in @filterStateList)
    newList.forEach (state) =>
      newListIndicator = []
      state.indicators.forEach (indicator) =>  
        newIndicator = {}
        if indicator.name in @indicatorsSelected
          newListIndicator.push indicator
        else
          newIndicator = new App.Indicator(indicator.name, 0)
          newListIndicator.push newIndicator
        return
      state.indicators = []
      state.indicators = newListIndicator
      @filterStateAndIndicatorsList.push state
      return
    @updateDraw()

  filterStateAndIndicators: =>
    @stateList.forEach (state) =>
      @filterStateList.push state if state.name in @statesSelected
    @filterStateAndIndicatorsList = ($.extend({}, state) for state in @filterStateList)
    @filterStateAndIndicatorsList.forEach (state) =>
      newListIndicator = []
      state.indicators.forEach (indicator) =>
        newListIndicator.push if (indicator.name in @indicatorsSelected) then indicator else new App.Indicator(indicator.name, 0)
      state.indicators = []
      state.indicators = newListIndicator




