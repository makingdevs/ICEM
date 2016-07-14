require 'singleton'
require 'excel_reader'

class MigrateDataManager

  include Singleton

  def migrate
    excelReader = ExcelReader.instance
    map = excelReader.read_simple_excel
    #leer libro excel
    #wraper
    #crear
  end

end