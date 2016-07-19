require 'manager/migrate_data_manager'
require 'daru'
require 'open-uri'

class WelcomeController < ApplicationController

  def read_excel
    migrateDataManager = MigrateDataManager.instance
    Thread.new{
      migrateDataManager.migrate
    }
    render json: Date.new()
  end

  def data_sample
    #content1 = open('http://icem.com.s3.amazonaws.com/Aguascalientes.csv')
    #content2 = open('https://raw.githubusercontent.com/makingdevs/ICEM/master/Aguascalientes.csv')
    data_frame_aguascalientes = Daru::DataFrame.from_csv('Aguascalientes.csv',encoding: "UTF-8")
    data_frame_baja_california = Daru::DataFrame.from_csv('Baja_California.csv',encoding: "UTF-8")
    #filtrar Seguridad pública y justicia
    #security = data_frame.where(data_frame["Tema_nivel_1"].eq('Seguridad pública y justicia'))
    #filtrar delitos
    security_aguascalientes = data_frame_aguascalientes.where(data_frame_aguascalientes["UnidadMedida"].eq('Delitos'))
    security_baja_california = data_frame_baja_california.where(data_frame_aguascalientes["UnidadMedida"].eq('Delitos'))
    #filtrar estatal
    #security = data_frame.where(data_frame["Desc_municipio"].eq('Estatal'))
    #filtrar Delitos registrados 
    security_aguascalientes = security_aguascalientes.where(security_aguascalientes["Tema_nivel_2"].eq('Delitos registrados'))
    security_baja_california = security_baja_california.where(security_baja_california["Tema_nivel_2"].eq('Delitos registrados'))
    s = "date\tAguascalientes\tBaja California\n"
    (2010..2015).each do |year|
      s << "#{year}0101\t#{security_aguascalientes[year].sum || 0}\t#{security_baja_california[year].sum || 0}\n"
    end
    render plain:s
  end

  def security
    
  end

end
