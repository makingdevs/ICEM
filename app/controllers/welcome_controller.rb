require 'manager/migrate_data_manager'
require 'daru'
require 'open-uri'
require 'csv'

class WelcomeController < ApplicationController

  def read_excel
    migrateDataManager = MigrateDataManager.instance
    Thread.new{
      migrateDataManager.migrate
    }
    render json: Date.new()
  end

  def data_sample
    data_frame = Daru::DataFrame.from_csv("Aguascalientes.csv")
    #content = open('http://icem.com.s3.amazonaws.com/01_Aguascalientes')
    #df = Daru::DataFrame.from_csv(houses)
    #los_de_25 = data_frame.where(data_frame["Age"].eq(25))
    #groups = los_de_25.group_by("Country")
    #s = ""
    #.html_safe.groups.each { |country,indexes| s << "#{country[0]}\t#{indexes.size}\n" }
    #render html: data_frame.inspect
    s = data_frame.to_s
    render html: s.html_safe
  end
end
