require 'manager/data_provider'
require 'daru'
require 'open-uri'

class WelcomeController < ApplicationController

  def data_sample
    data_manager = DataProvider.instance
    data_frame_aguascalientes = data_manager.data_frame_aguascalientes
    data_frame_baja_california = data_manager.data_frame_baja_california
    data_frame_baja_california_sur = data_manager.data_frame_baja_california_sur
    data_frame_campeche = data_manager.data_frame_campeche
    data_frame_coahuila_de_zaragoza = data_manager.data_frame_coahuila_de_zaragoza

    security_aguascalientes = data_frame_aguascalientes.where(data_frame_aguascalientes["UnidadMedida"].eq('Delitos'))
    security_baja_california = data_frame_baja_california.where(data_frame_aguascalientes["UnidadMedida"].eq('Delitos'))
    security_baja_california_sur = data_frame_baja_california_sur.where(data_frame_baja_california_sur["UnidadMedida"].eq('Delitos'))
    security_campeche = data_frame_campeche.where(data_frame_campeche["UnidadMedida"].eq('Delitos'))
    security_coahuila_de_zaragoza = data_frame_coahuila_de_zaragoza.where(data_frame_coahuila_de_zaragoza["UnidadMedida"].eq('Delitos'))

    security_aguascalientes = security_aguascalientes.where(security_aguascalientes["Tema_nivel_2"].eq('Delitos registrados'))
    security_baja_california = security_baja_california.where(security_baja_california["Tema_nivel_2"].eq('Delitos registrados'))
    security_baja_california_sur = security_baja_california_sur.where(security_baja_california_sur["Tema_nivel_2"].eq('Delitos registrados'))
    security_campeche = security_campeche.where(security_campeche["Tema_nivel_2"].eq('Delitos registrados'))
    security_coahuila_de_zaragoza = security_coahuila_de_zaragoza.where(security_coahuila_de_zaragoza["Tema_nivel_2"].eq('Delitos registrados'))

    s = "date\tAguascalientes\tBaja California\tBaja California Sur\tCampeche\tCoahuila de Zaragoza\n"
    (2010..2015).each do |year|
      s << "#{year}0101\t#{security_aguascalientes[year].sum || 0}\t#{security_baja_california[year].sum || 0}\t#{security_baja_california_sur[year].sum || 0}\t#{security_campeche[year].sum || 0}\t#{security_coahuila_de_zaragoza[year].sum || 0}\n"
    end

    render plain:s
  end

  def security
    
  end

end
