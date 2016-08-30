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

  def data_map
    indicator = Indicators.values.find {|key, value| key.to_s == params[:indicator]}
    render json: 
    {
      color: indicator[1][:color],
      data: 
                  [
                    {
                      'hc-key': 'mx-3622',
                      'value': Random.rand(10)+1
                    },
                    {
                      'hc-key': 'mx-bc',
                      'value': Random.rand(10)+1
                    },
                    {
                      'hc-key': 'mx-bs',
                      'value': Random.rand(10)+1
                    },
                    {
                      'hc-key': 'mx-so',
                      'value': Random.rand(10)+1
                    },
                    {
                      'hc-key': 'mx-cl',
                      'value': Random.rand(10)+1
                    },
                    {
                      'hc-key': 'mx-na',
                      'value': Random.rand(10)+1
                    },
                    {
                      'hc-key': 'mx-cm',
                      'value': Random.rand(10)+1
                    },
                    {
                      'hc-key': 'mx-qr',
                      'value': Random.rand(10)+1
                    },
                    {
                      'hc-key': 'mx-mx',
                      'value': Random.rand(10)+1
                    },
                    {
                      'hc-key': 'mx-mo',
                      'value': Random.rand(10)+1
                    },
                    {
                      'hc-key': 'mx-df',
                      'value': Random.rand(10)+1
                    },
                    {
                      'hc-key': 'mx-qt',
                      'value': Random.rand(10)+1
                    },
                    {
                      'hc-key': 'mx-tb',
                      'value': Random.rand(10)+1
                    },
                    {
                      'hc-key': 'mx-cs',
                      'value': Random.rand(10)+1
                    },
                    {
                      'hc-key': 'mx-nl',
                      'value': Random.rand(10)+1
                    },
                    {
                      'hc-key': 'mx-si',
                      'value': Random.rand(10)+1
                    },
                    {
                      'hc-key': 'mx-ch',
                      'value': Random.rand(10)+1
                    },
                    {
                      'hc-key': 'mx-ve',
                      'value': Random.rand(10)+1
                    },
                    {
                      'hc-key': 'mx-za',
                      'value': Random.rand(10)+1
                    },
                    {
                      'hc-key': 'mx-ag',
                      'value': Random.rand(10)+1
                    },
                    {
                      'hc-key': 'mx-ja',
                      'value': Random.rand(10)+1
                    },
                    {
                      'hc-key': 'mx-mi',
                      'value': Random.rand(10)+1
                    },
                    {
                      'hc-key': 'mx-oa',
                      'value': Random.rand(10)+1
                    },
                    {
                      'hc-key': 'mx-pu',
                      'value': Random.rand(10)+1
                    },
                    {
                      'hc-key': 'mx-gr',
                      'value': Random.rand(10)+1
                    },
                    {
                      'hc-key': 'mx-tl',
                      'value': Random.rand(10)+1
                    },
                    {
                      'hc-key': 'mx-tm',
                      'value': Random.rand(10)+1
                    },
                    {
                      'hc-key': 'mx-co',
                      'value': Random.rand(10)+1
                    },
                    {
                      'hc-key': 'mx-yu',
                      'value': Random.rand(10)+1
                    },
                    {
                      'hc-key': 'mx-dg',
                      'value': Random.rand(10)+1
                    },
                    {
                      'hc-key': 'mx-gj',
                      'value': Random.rand(10)+1
                    },
                    {
                      'hc-key': 'mx-sl',
                      'value': Random.rand(10)+1
                    },
                    {
                      'hc-key': 'mx-hg',
                      'value': Random.rand(10)+1
                    }
                  ]
                }
  end

end
