class App.State

  constructor: (options) ->
    { @name } = options
    @indicators = []
    for prop of options
      if prop != 'name'
        indicator = new App.Indicator(prop,options[prop])
        @indicators.push indicator
    return

  indicators: (@indicators) ->


class App.Indicator

  constructor: (@name, @value) ->