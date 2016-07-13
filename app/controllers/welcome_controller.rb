class WelcomeController < ApplicationController

  def readExcel   
    header = [0,1,2,3,4]
    resultRow = []
    workbook = RubyXL::Parser.parse("/Users/makingdevs/Downloads/06_Colima.xlsx")
    workbook['Valor'].each_with_index { |row, index|  
      if row && !(header.include? index)
        row.cells.each { |cell|
          val = cell && cell.value
          resultRow << val
        }
        puts resultRow.inspect()
        puts "resultRow"
        resultRow = []
      end
    }
    render json: Date.new()
  end
end