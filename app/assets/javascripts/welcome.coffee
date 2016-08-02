#= require app
#= require models
#= require presenters

class App.AppHome

  bindEvents: ->

  start: ->
    width = 150
    height = 155
    element = '#graphs'
    v = new App.Visualization(width, height, element)
    v.getData()

app = new App.AppHome()
app.start()