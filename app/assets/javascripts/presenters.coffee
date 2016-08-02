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
    @arc = d3.svg.arc().outerRadius(@radius - 10).innerRadius(@radius - 40)
    @pie = d3.layout.pie().sort(null).value((d) ->
      d.value
    )
    @stateList = []

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
      svg = d3.select(@element).append('svg').attr('width', @width).attr('height', @height).append('g').attr('transform', 'translate(' + @width / 2 + ',' + @height / 2 + ')')
      path = svg.datum(state.indicators).selectAll('path').data(@pie).enter().append('path').attr('fill', (d) =>
        @color d.data.name
      ).attr('d', @arc)
      svg.append("text").attr("x", 0).attr("y", 75)
      .style("text-anchor", "middle").text(state.name)
      state.svg = svg
      return
    @renderLegend()
    @bindEvents()

  updateDraw: =>
    @stateList.forEach (state) =>
      indicators = ( new App.Indicator(indicator.name, Math.random())  for indicator in state.indicators)
      state.svg.datum(indicators).selectAll('path').data(@pie).attr('d', @arc)
      return

  bindEvents: ->
    $('input[type="range"]').on('change', @updateDraw)