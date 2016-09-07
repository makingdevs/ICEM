require 'open-uri'
require 'enums/states'
require 'enums/indicators'

class WelcomeController < ApplicationController

  def index

    @indicators = Indicators.values
    @indicators_map = Indicators.values.collect  do |key, value| 
      {name:value[:name], color:value[:color], code:key}
    end
    @states = States.values
    render states: @states, indicators: @indicators, indicators_map: @indicators_map
  end

  def data_sample
    render plain: open('http://icem.com.s3.amazonaws.com/data_states.csv'){ |f| f.read }
  end

  def read_csv_states
    states = []
    CSV.foreach("estadisticas.csv",headers:true) do |row| 
      states << row.to_hash
    end
    states
  end

  def data_map
    states = read_csv_states()
    indicator = Indicators.values.find {|key, value| key.to_s == params[:indicator]}
    data = States.values.collect { |key, value| 
      state = states.find { |state| state["state"] == value[:name]}
      {
        'hc-key': value[:code],
        'value': state[indicator[1][:name]].to_i
      }
    }
    render json: 
    {
      color: indicator[1][:color],
      data:data
    }
  end

end
