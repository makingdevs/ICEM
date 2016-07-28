width = 960
height = 500
radius = Math.min(width, height) / 2
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
  d.intensity
)

typeAnother = (d) ->
  for prop of d
    d[prop] = +d[prop] if prop != 'State'
  d

preparingData = (data) ->
  list = []
  for prop of data
    if prop != 'State'
      obj =
        indicator: prop
        intensity: data[prop]
      list.push obj
  list

d3.csv '/renderDataExampe', typeAnother, (error, data) ->
  # debugger
  if error
    throw error
  list = (preparingData(state) for state in data)

  debugger

  list.forEach (data) ->
    svg = d3.select('#graphs').append('svg').attr('width', width).attr('height', height).append('g').attr('transform', 'translate(' + width / 2 + ',' + height / 2 + ')')
    g = svg.selectAll('.arc').data(pie(data)).enter().append('g').attr('class', 'arc')
    g.append('path').attr('d', arc).style 'fill', (d) ->
      color d.data.indicator
    g.append('text').attr('transform', (d) ->
      'translate(' + labelArc.centroid(d) + ')'
    ).attr('dy', '.35em').text (d) ->
      d.data.indicator
    return
  return
