require 'enums/states'
require 'enums/indicators'

class IndicatorsController < ApplicationController

  def indicators
    p params[:name]
    @indicators = Indicators.constants.collect  do |indicator| Indicators.const_get(indicator) end
    @states = States.constants.collect  do |state| States.const_get(state) end
    render states: @states, Indicators: @indicators
  end

end
