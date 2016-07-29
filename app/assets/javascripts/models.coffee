class App.State

  constructor: (options) ->
    { @name } = options
    @indicators = []
    for prop of options
      if prop != 'name'
        indicator = new App.Indicator(prop,options[prop])
        @indicators.push indicator
    return

  indicators: (@indicators) ->


class App.Indicator

  constructor: (@name, @value) ->


class App.Visualization
  
  constructor: (@width, @height, @element) ->

  wrapperCharsToNumber: (row) ->
    for prop of row
      row[prop] = +row[prop] if prop != 'name'
    row

  draw: () -> 
    transformRowToState = (row) ->
      new App.State(row)

    radius = Math.min(@width, @height) / 2
    color = d3.scale.ordinal().range([
      '#98abc5'
      '#8a89a6'
      '#7b6888'
      '#6b486b'
      '#a05d56'
      '#d0743c'
      '#ff8c00'
    ])
    arc = d3.svg.arc().outerRadius(radius - 10).innerRadius(0)
    labelArc = d3.svg.arc().outerRadius(radius - 40).innerRadius(radius - 40)
    pie = d3.layout.pie().sort(null).value((d) ->
      d.value
    )
    d3.csv '/renderDataExampe', @wrapperCharsToNumber, (error, data) =>
      if error
        throw error
      stateList = (transformRowToState(state) for state in data)
      
      stateList.forEach (state) =>
        svg = d3.select(@element).append('svg').attr('width', @width).attr('height', @height).append('g').attr('transform', 'translate(' + @width / 2 + ',' + @height / 2 + ')')
        g = svg.selectAll('.arc').data(pie(state.indicators)).enter().append('g').attr('class', 'arc')
        g.append('path').attr('d', arc).style 'fill', (slice) ->
          color slice.data.name
        g.append('text').attr('transform', (slice) ->
          'translate(' + labelArc.centroid(slice) + ')'
        ).attr('dy', '.35em').text (slice) ->
          slice.data.name
        return
      return