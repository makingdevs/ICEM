class CreateDataIndicators < ActiveRecord::Migration[5.0]
  def change
    create_table :data_indicators do |t|
      t.string :federal_entity
      t.string :main_category
      t.string :category
      t.string :subcategory
      t.string :indicator
      t.string :year
      t.string :unit_of_measurement

      t.timestamps
    end
  end
end
