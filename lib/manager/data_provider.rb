require 'singleton'

class DataProvider 
  include Singleton

  attr_accessor :data_frame_aguascalientes, :data_frame_baja_california

  def initialize
    @data_frame_aguascalientes = Daru::DataFrame.from_csv('Aguascalientes.csv',encoding: "UTF-8")
    @data_frame_baja_california = Daru::DataFrame.from_csv('Baja_California.csv',encoding: "UTF-8")
  end

end