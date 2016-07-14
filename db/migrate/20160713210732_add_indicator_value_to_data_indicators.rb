class AddIndicatorValueToDataIndicators < ActiveRecord::Migration[5.0]
  def change
    add_column :data_indicators, :indicator_value, :string
  end
end
