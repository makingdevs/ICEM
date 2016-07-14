require 'manager/migrate_data_manager'

class WelcomeController < ApplicationController

  def readExcel
    migrateDataManager = MigrateDataManager.instance
    Thread.new{
      migrateDataManager.migrate
    }
    render json: Date.new()
  end
end