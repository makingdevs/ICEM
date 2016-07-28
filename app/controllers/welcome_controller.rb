require 'manager/data_provider'
require 'enums/states'
require 'open-uri'

class WelcomeController < ApplicationController

  def data_sample
    startRange = (params[:startRange] || 2010).to_i
    endRange = (params[:endRange] || 2015).to_i
    data_manager = DataProvider.instance
    data_frames = data_manager.getDataFrames(params[:state])
    security_data_frames = {}

    #TODO metodo que filtre cualquier data frame por algun parametro
    data_frames.each do |state, data_frame|
      security_data_frame = data_frame.where(data_frame["UnidadMedida"].eq('Delitos'))
      security_data_frames[state] = security_data_frame.where(security_data_frame["Tema_nivel_2"].eq('Delitos registrados')) 
    end

    #TODO Esto seria un metodo que forme el encabezado
    s = "date"
    security_data_frames.each do |state, data_frame|
      s << "\t#{States.const_get(state)}"
    end
    s <<"\n"

    #TODO Esto seria un metodo que forme el cuerpo del tsv
    (startRange..endRange).each do |year|
      s << "#{year}0101"
      data_frames.keys.each do |state|
        s << "\t#{security_data_frames[state][year].sum || 0}"
      end
      s << "\n"
    end

    render plain:s
  end

  def renderDataExampe
    render plain: open('http://icem.com.s3.amazonaws.com/aster_data.csv'){ |f| f.read }
  end

  def example
  end

end
