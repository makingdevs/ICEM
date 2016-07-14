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
    p data_frame
    render plain: s
  end
end
