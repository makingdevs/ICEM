#= require app
#= require models
#= require presenters
#= require seiyria-bootstrap-slider/dist/bootstrap-slider

class App.AppHome

  bindEvents: ->

  start: ->
    width = 120
    height = 135
    element = '#graphs'
    v = new App.Visualization(width, height, element)
    v.getData()

app = new App.AppHome()
app.start()