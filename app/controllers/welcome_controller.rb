require 'manager/data_provider'
require 'daru'
require 'open-uri'

class WelcomeController < ApplicationController

  def data_sample
    startRange = (params[:startRange] || 2010).to_i
    endRange = (params[:endRange] || 2015).to_i
    data_manager = DataProvider.instance
    data_frames = data_manager.getDataFrames(params[:state] || "Ags,BC,BCS,Camp,Coah")
    security_data_frames = {}

    data_frames.each do |state, data_frame|
      security_data_frame = data_frame.where(data_frame["UnidadMedida"].eq('Delitos'))
      security_data_frames[state] = security_data_frame.where(security_data_frame["Tema_nivel_2"].eq('Delitos registrados')) 
    end

    s = "date"

    security_data_frames.each do |state, data_frame|
      s << "\t#{state}"
    end

    s <<"\n"

    (startRange..endRange).each do |year|
      s << "#{year}0101"
      data_frames.keys.each do |state|
        s << "\t#{security_data_frames[state][year].sum || 0}"
      end
      s << "\n"
    end
    render plain:s
  end

  def security
  end

end
