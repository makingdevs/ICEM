require 'singleton'

class ExcelReader

  include Singleton

  def read_simple_excel
    header = [0,1,2,3,4]
    listYears = Rails.application.secrets.registered_years
    listYears = listYears.split(',')
    resultRow = []
    resultList = []
    workbook = RubyXL::Parser.parse("/Users/makingdevs/Downloads/20_Oaxaca.xlsx")
    workbook['Valor'].each_with_index { |row, index|  
      if row && !(header.include? index)
        row.cells.each { |cell|
          val = cell && cell.value
          resultRow << val
        }
        (9..57).each_with_index{ |cell, index|
          resultList << { :federal_entity => resultRow[1], :main_category=>resultRow[4], 
                          :category=>resultRow[5], :subcategory=>resultRow[6], 
                          :indicator=>resultRow[8], :indicator_value=>resultRow[cell], 
                          :year=> listYears[index], :unit_of_measurement=>resultRow.reverse.first }
        }
        resultRow = []
      end
    }
    resultList
  end

end