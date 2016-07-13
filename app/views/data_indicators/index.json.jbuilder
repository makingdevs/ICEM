json.array!(@data_indicators) do |data_indicator|
  json.extract! data_indicator, :id, :federal_entity, :main_category, :category, :subcategory, :indicator, :year, :unit_of_measurement
  json.url data_indicator_url(data_indicator, format: :json)
end
