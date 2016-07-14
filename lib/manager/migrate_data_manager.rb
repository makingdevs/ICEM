require 'singleton'
require 'excel_reader'
require 'manager/data_indicators_manager'

class MigrateDataManager

  include Singleton

  def migrate
    excelReader = ExcelReader.instance
    dataIndicatorsManager = DataIndicatorsManager.instance
    listOfRecords = excelReader.read_simple_excel
    listOfRecords.each { |record|
      dataIndicatorsManager.create(record)
    }
  end

end