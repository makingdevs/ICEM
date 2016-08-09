#= require app
#= require presenters

describe 'App: Visualization', ->
  it "creates a new visualization", ->
    v = new App.Visualization(12,2,"#e")
    expect(v.radius).toEqual(1)
  