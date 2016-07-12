class WelcomeController < ApplicationController

  def readExcel   
    workbook = RubyXL::Parser.parse("/Users/makingdevs/Downloads/06_Colima.xlsx")
    workbook['Valor'].each { |row|
      row && row.cells.each { |cell|
        val = cell && cell.value
        puts val
      }
    }
    render json: Date.new()
  end

end
