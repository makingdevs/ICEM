#= require app
#= require presenters

describe 'App: Visualization', ->
  it "creates a new visualization", ->
    v = new App.Visualization(12,2,"#e")
    expect(v.radius).toEqual(1)

  it "Try to coercion properties of rows", ->
    v = new App.Visualization()
    row = {"name":"CDMX","housing":"0.1"}
    row = v.wrapperCharsToNumber(row)
    expect(v).not.toBe(null)
    expect(row.housing).toEqual(0.1)

  it "Filter indicators in list of states", ->
    #create App.Visualization
    v = new App.Visualization()
    #Mock method lookUpChanges and variables
    spyOn(v, "lookUpChanges")
    spyOn(v, "updateDraw")
    v.indicatorsSelected = ["Vivienda"]
    v.stateList = 
      [
        new App.State({name:"CDMX",Vivienda:0.2,Ingresos:0.5}),
        new App.State({name:"Colima",Vivienda:.5,Ingresos:0.1})
      ]
    #call the filterIndicators method
    v.filterIndicators()
    #then App.Visualization sould
    expect(v).not.toBe(null)
    expect(v.filterStateList.length).toEqual(2)
    expect(v.filterStateList[0].indicators.length).toEqual(2)
    expect(v.filterStateList[0].indicators[0].value).toEqual(0.2)
    expect(v.filterStateList[0].indicators[1].value).toEqual(0.0)

  it "Calculate factor to radio of svg", ->
    #create App.Visualization
    v = new App.Visualization()
    #Init State
    state = new App.State({name:"CDMX",Ingresos:0.5,Vivienda:0.2})
    #call the filterIndicators method
    factor = v.calculateFactor(state)
    #then App.Visualization sould
    expect(v).not.toBe(null)
    expect(factor).toEqual(34)
    