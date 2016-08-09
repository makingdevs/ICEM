#= require app
#= require models

describe 'Application: States', ->
  it 'create a new state with only the name', ->
    state =  new App.State({name:"CDMX"})
    expect(state.name).toEqual("CDMX")

  it 'create a new state with indicators', ->
    data = {"name":"CDMX","housing":"0.1"}
    state =  new App.State(data)
    expect(state.indicators).not.toBe(null)
    expect(state.indicators.length).toEqual(1)


