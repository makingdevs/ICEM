require 'enums/states'
require 'enums/indicators'

class AboutController < ApplicationController

  def index
    @indicators = Indicators.values.collect do |key, value| value[:name] end
    @states = States.values
    render states: @states, Indicators: @indicators
  end

end
