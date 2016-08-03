require 'open-uri'
require 'enums/states'
require 'enums/indicators'

class WelcomeController < ApplicationController

  def index
    @indicators = Indicators.constants.collect  do |indicator| Indicators.const_get(indicator) end
    @states = States.constants.collect  do |state| States.const_get(state) end
    render states: @states, indicators: @indicators
  end

  def data_sample
    render plain: open('http://icem.com.s3.amazonaws.com/data_states.csv'){ |f| f.read }
  end

end
