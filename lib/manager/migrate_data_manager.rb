require 'singleton'
require 'excel_reader'
require 'manager/data_indicators_manager'

class MigrateDataManager

  include Singleton

  def migrate
    excelReader = ExcelReader.instance
    dataIndicatorsManager = DataIndicatorsManager.instance
    listOfRecords = excelReader.read_simple_excel
    registro = dataIndicatorsManager.create(listOfRecords.first)
    puts registro
  end

end