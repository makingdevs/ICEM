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


  