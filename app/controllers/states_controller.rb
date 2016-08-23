require 'enums/states'
require 'enums/indicators'

class StatesController < ApplicationController

  def states
    p params[:name]
    @indicators = Indicators.constants.collect  do |indicator| Indicators.const_get(indicator).split(",")[0] end
    @states = States.constants.collect  do |state| States.const_get(state) end
    render states: @states, Indicators: @indicators
  end

end
