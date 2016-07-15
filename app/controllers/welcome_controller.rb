require 'manager/migrate_data_manager'
require 'daru'

class WelcomeController < ApplicationController

  def read_excel
    migrateDataManager = MigrateDataManager.instance
    Thread.new{
      migrateDataManager.migrate
    }
    render json: Date.new()
  end

  def data_sample
    s = IO.read("/Users/makingdevs/Desktop/worldcupplayerinfo_20140701.tsv")
    data_frame = Daru::DataFrame.from_csv("/Users/makingdevs/Desktop/worldcupplayerinfo_20140701.tsv", { :col_sep => "\t"})
    los_de_25 = data_frame.where(data_frame["Age"].eq(25))
    groups = los_de_25.group_by("Country")
    s = "Country\tSize\n"
    groups.groups.each { |country,indexes| s << "#{country[0]}\t#{indexes.size}\n" }
    render plain: s
  end
end
