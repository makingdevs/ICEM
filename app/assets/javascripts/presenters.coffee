class App.Legend

  constructor: (@template, @element) ->

  initThirdParty: ->
    $('input[type="range"]').slider()

  render: (data) ->
    source = $(@template).html()
    resultTemplate = Handlebars.compile(source)
    html = resultTemplate(data)
    $(@element).html html
    @initThirdParty()

class App.Visualization
  constructor: (@width, @height, @element) ->
    @radius = Math.min(@width, @height) / 2
    @color = d3.scale.category20()
    @pie = d3.layout.pie().sort(null).value((d) ->
      d.value
    )
    @stateList = []
    @filterStateList = []
    @indicatorsSelected = []
    @num = 0

  wrapperCharsToNumber: (row) ->
    for prop of row
      row[prop] = +row[prop] if prop != 'name'
    row

  renderLegend: ->
    lista = ({color:@color(indicator),name:indicator} for indicator in @color.domain())
    legend = new App.Legend("#legend-table-template","#legend")
    legend.render(lista)

  transformRowToState: (row) ->
      new App.State(row)

  getData: () ->
    d3.csv $("#data_url").val(), @wrapperCharsToNumber, (error, data) =>
      if error 
        throw error
      @stateList = (@transformRowToState(state) for state in data)
      @draw()
      return

  draw: -> 
    @stateList.forEach (state) =>
      counter = 0
      avg = 0.0
      avg += indicador.value for indicador in state.indicators
      state.indicators.forEach (indicator) ->
        if indicator.value > 0 
          counter += 1
        return
      avg = (avg / (counter))
      avg = Math.round(avg * 10) / 10 
      @factor = 50 - (avg*40)
      @arc = d3.svg.arc().outerRadius(@radius - @factor).innerRadius(@radius - 50)
      svg = d3.select(@element).append('svg').attr('width', @width).attr('height', @height).append('g').attr('transform', 'translate(' + @width / 2 + ',' + @height / 2 + ')')
      path = svg.datum(state.indicators).selectAll('path').data(@pie).enter().append('path').attr('fill', (d) =>
        @color d.data.name
      ).attr('d', @arc).each (d) => 
        @current = d 
      svg.append("text").attr("x", 0).attr("y", 62)
      .style("text-anchor", "middle").text(state.name)
      state.svg = svg
      return
    @renderLegend()
    @bindEvents()

  updateDraw: =>
    @filterStateList.forEach (state) =>
      counter = 0
      avg = 0.0
      avg += indicador.value for indicador in state.indicators
      state.indicators.forEach (indicator) ->
        if indicator.value > 0 
          counter += 1
        return
      avg = (avg / (counter))
      avg = Math.round(avg * 10) / 10 
      @factor = 50 - (avg*40)

      @arc = d3.svg.arc().outerRadius(@radius - @factor).innerRadius(@radius - 50)
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
    newList = ($.extend({}, state) for state in @stateList)
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
      @filterStateList.push state
      return
    @updateDraw()
    
  Array::unique = ->
    output = {}
    output[@[key]] = @[key] for key in [0...@length]
    value for key, value of output
    
