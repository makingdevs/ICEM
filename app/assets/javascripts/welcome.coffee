#= require app
#= require models
#= require presenters

width = 150
height = 155
element = '#graphs'

v = new App.Visualization(width, height, element)
v.getData()