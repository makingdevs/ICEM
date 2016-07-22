require 'singleton'

class DataProvider 
  include Singleton

  attr_accessor :data_frame_aguascalientes, :data_frame_baja_california,
  :data_frame_baja_california_sur, :data_frame_campeche, :data_frame_coahuila_de_zaragoza

  def initialize
    @data_frame_aguascalientes = Daru::DataFrame.from_csv('Aguascalientes.csv',encoding: "UTF-8")
    @data_frame_baja_california = Daru::DataFrame.from_csv('Baja_California.csv',encoding: "UTF-8")
    @data_frame_baja_california_sur = Daru::DataFrame.from_csv('Baja_California_Sur.csv',encoding: "UTF-8")
    @data_frame_campeche = Daru::DataFrame.from_csv('Campeche.csv',encoding: "UTF-8")
    @data_frame_coahuila_de_zaragoza = Daru::DataFrame.from_csv('Coahuila_de_Zaragoza.csv',encoding: "UTF-8")
  end

  def getDataFrames(states)
    data_frames = { "AGS" => @data_frame_aguascalientes, 
                    "BC" => @data_frame_baja_california,
                    "BCS" => @data_frame_baja_california_sur,
                    "CAMP" => @data_frame_campeche,
                    "COAH" => @data_frame_coahuila_de_zaragoza}
    listStates = states ? states.split(",") : data_frames.keys
    mapDataFrames = {}
    listStates.each do |state|
      mapDataFrames[state] = data_frames[state]
    end
    mapDataFrames
  end

end