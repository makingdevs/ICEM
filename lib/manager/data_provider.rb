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

end