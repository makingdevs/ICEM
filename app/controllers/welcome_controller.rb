require 'open-uri'

class WelcomeController < ApplicationController

  def data_sample
    render plain: open('http://icem.com.s3.amazonaws.com/data_states.csv'){ |f| f.read }
  end

end
