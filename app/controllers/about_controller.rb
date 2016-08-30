require 'enums/states'
require 'enums/indicators'

class AboutController < ApplicationController

  def index
    @indicators = Indicators.values
    @states = States.values
    render states: @states, Indicators: @indicators
  end

end
