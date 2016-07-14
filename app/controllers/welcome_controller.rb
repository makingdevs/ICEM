require 'excel_reader'

class WelcomeController < ApplicationController

  def readExcel
    obj = ExcelReader.instance
    Thread.new{
      list = obj.read_simple_excel
    }
    render json: Date.new()
  end
end