class App.Legend

  constructor: (@template, @element) ->

  render: (data) ->
    source = $(@template).html()
    resultTemplate = Handlebars.compile(source)
    html = resultTemplate(data)
    $(@element).html html
    this.initThirdParty()

  initThirdParty: ->
    $('input[type="range"]').slider();

class App.Visualization
  
  constructor: (@width, @height, @element) ->

  wrapperCharsToNumber: (row) ->
    for prop of row
      row[prop] = +row[prop] if prop != 'name'
    row

  renderTable: (color) ->
    lista = ({color:color(indicator),name:indicator} for indicator in color.domain())
    legend = new App.Legend("#legend-table-template","#legend")
    legend.render(lista)

  draw: () -> 
    transformRowToState = (row) ->
      new App.State(row)

    radius = Math.min(@width, @height) / 2

    color = d3.scale.category10()

    arc = d3.svg.arc().outerRadius(radius - 10).innerRadius(radius - 40)

    labelArc = d3.svg.arc().outerRadius(radius - 40).innerRadius(radius - 40)

    pie = d3.layout.pie().sort(null).value((d) ->
      d.value
    )

    d3.csv $("#data_url").val(), @wrapperCharsToNumber, (error, data) =>
      if error
        throw error

      stateList = (transformRowToState(state) for state in data)
      
      stateList.forEach (state) =>
        svg = d3.select(@element).append('svg').attr('width', @width).attr('height', @height).append('g').attr('transform', 'translate(' + @width / 2 + ',' + @height / 2 + ')')
        g = svg.selectAll('.arc').data(pie(state.indicators)).enter().append('g').attr('class', 'arc')
        g.append('path').attr('d', arc).style 'fill', (slice) ->
          color slice.data.name

        svg.append("text").attr("x", 0).attr("y", 75)
        .style("text-anchor", "middle").text(state.name)
        return
      @renderTable(color)
      return