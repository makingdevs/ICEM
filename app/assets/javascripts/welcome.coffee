#= require app
#= require models
#= require presenters

class App.AppHome

  constructor: ->
    width = 120
    height = 135
    element = '#graphs'
    @visualization = new App.Visualization(width, height, element)
    @bindEvents()
    @initThirdParty()

  initThirdParty: ->
    $('.parallax').parallax()

  bindEvents: ->    
    $("#submitGraph").on("click", @findAndRetrieve)
    
  findAndRetrieve: =>
    indicatorsSelected = statesSelected = ""
    $(".state").each (index, element) ->
      statesSelected += $(element).attr('name')+"," if $(element).is(':checked')
    $(".indicator").each (index, element) ->
      indicatorsSelected += $(element).attr('name')+"," if $(element).is(':checked')
    indicatorsSelected = if indicatorsSelected then indicatorsSelected else ( $(element).attr('name') for element in $(".indicator") ).toString()+","
    statesSelected = if statesSelected then statesSelected else ( $(element).attr('name') for element in $(".state") ).toString()+","
    indicatorsSelected = indicatorsSelected.split(",")
    statesSelected = statesSelected.split(",")
    indicatorsSelected.pop()
    statesSelected.pop()
    @visualization.indicatorsSelected = indicatorsSelected
    @visualization.statesSelected = statesSelected
    @renderVisualization()

  renderVisualization: =>
    @visualization.getData()
    $("#menu").html("")

new App.AppHome()