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
    content1 = open('http://icem.com.s3.amazonaws.com/Aguascalientes.csv') { |f| f.read }
    content2 = open('https://raw.githubusercontent.com/makingdevs/ICEM/master/Aguascalientes.csv')
    puts content1
    file = File.open("yourfile.csv", 'w') { |file| file.write(content1) }
    puts content2

    data_frame = Daru::DataFrame.from_csv file


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
