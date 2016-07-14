require 'singleton'

class DataIndicatorsManager

  include Singleton

  def create(dataIndicator)
    dataIndicator = DataIndicator.new(dataIndicator)
    dataIndicator.save
    dataIndicator
  end

end