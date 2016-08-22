require 'enums/states'
require 'enums/indicators'

class ExampleController < ApplicationController

  def index
    @indicators = Indicators.constants.collect  do |indicator| Indicators.const_get(indicator) end
    @states = States.constants.collect  do |state| States.const_get(state) end
    render states: @states, Indicators: @indicators
  end

  def data_sample
    render json: [
                    {
                      'hc-key': 'mx-3622',
                      'value': 10
                    },
                    {
                      'hc-key': 'mx-bc',
                      'value': 1
                    },
                    {
                      'hc-key': 'mx-bs',
                      'value': 2
                    },
                    {
                      'hc-key': 'mx-so',
                      'value': 2
                    },
                    {
                      'hc-key': 'mx-cl',
                      'value': 1
                    },
                    {
                      'hc-key': 'mx-na',
                      'value': 10
                    },
                    {
                      'hc-key': 'mx-cm',
                      'value': 6
                    },
                    {
                      'hc-key': 'mx-qr',
                      'value': 7
                    },
                    {
                      'hc-key': 'mx-mx',
                      'value': 8
                    },
                    {
                      'hc-key': 'mx-mo',
                      'value': 9
                    },
                    {
                      'hc-key': 'mx-df',
                      'value': 10
                    },
                    {
                      'hc-key': 'mx-qt',
                      'value': 1
                    },
                    {
                      'hc-key': 'mx-tb',
                      'value': 2
                    },
                    {
                      'hc-key': 'mx-cs',
                      'value': 3
                    },
                    {
                      'hc-key': 'mx-nl',
                      'value': 4
                    },
                    {
                      'hc-key': 'mx-si',
                      'value': 6
                    },
                    {
                      'hc-key': 'mx-ch',
                      'value': 6
                    },
                    {
                      'hc-key': 'mx-ve',
                      'value': 7
                    },
                    {
                      'hc-key': 'mx-za',
                      'value': 8
                    },
                    {
                      'hc-key': 'mx-ag',
                      'value': 9
                    },
                    {
                      'hc-key': 'mx-ja',
                      'value': 2
                    },
                    {
                      'hc-key': 'mx-mi',
                      'value': 1
                    },
                    {
                      'hc-key': 'mx-oa',
                      'value': 2
                    },
                    {
                      'hc-key': 'mx-pu',
                      'value': 3
                    },
                    {
                      'hc-key': 'mx-gr',
                      'value': 24
                    },
                    {
                      'hc-key': 'mx-tl',
                      'value': 25
                    },
                    {
                      'hc-key': 'mx-tm',
                      'value': 6
                    },
                    {
                      'hc-key': 'mx-co',
                      'value': 7
                    },
                    {
                      'hc-key': 'mx-yu',
                      'value': 8
                    },
                    {
                      'hc-key': 'mx-dg',
                      'value': 2
                    },
                    {
                      'hc-key': 'mx-gj',
                      'value': 3
                    },
                    {
                      'hc-key': 'mx-sl',
                      'value': 3
                    },
                    {
                      'hc-key': 'mx-hg',
                      'value': 2
                    }
                  ]
  end

end

