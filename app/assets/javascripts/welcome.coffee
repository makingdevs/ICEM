#= require app
#= require models
#= require presenters

width = 250
height = 150
element = '#graphs'

v = new App.Visualization(width, height, element)
v.draw()
