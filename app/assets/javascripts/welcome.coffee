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
    @validateSizeCircles(statesSelected)
    @renderVisualization()

  validateSizeCircles: (statesSelected) =>
    if statesSelected.length >= 11 
      @visualization.magicNumber = 50 
      @visualization.radius = Math.min(120, 135) / 2

    if statesSelected.length <= 4 
      @visualization.magicNumber = 25
      @visualization.radius = Math.min(300, 350) / 2
      @visualization.width = 300
      @visualization.height = 350

    if statesSelected.length > 4 and statesSelected.length < 11
      @visualization.magicNumber = 25
      @visualization.radius = Math.min(200, 210) / 2
      @visualization.width = 210
      @visualization.height = 220

  renderVisualization: =>
    @visualization.getData()
    $('#menu').fadeOut 'slow', ->
      $('#menu').html ''


  #4 - 300 - 350

  #todos - 120 - 135

new App.AppHome()