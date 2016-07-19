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
    data_frame = Daru::DataFrame.from_csv('Aguascalientes.csv',encoding: "UTF-8")
    #filtrar Seguridad pública y justicia
    security = data_frame.where(data_frame["Tema_nivel_1"].eq('Seguridad pública y justicia'))
    #filtrar delitos
    security = data_frame.where(data_frame["UnidadMedida"].eq('Delitos'))
    #filtrar estatal
    security = data_frame.where(data_frame["Desc_municipio"].eq('Estatal'))
    #filtrar Delitos registrados 
    security = data_frame.where(data_frame["Tema_nivel_2"].eq('Delitos registrados'))
    s = "date\tAguascalientes\n"
    (2010..2015).each do |year|
      s << "#{year}0101\t#{security[year].sum || 0}\n"
    end
    render plain:s
  end

  def security
    
  end

end
