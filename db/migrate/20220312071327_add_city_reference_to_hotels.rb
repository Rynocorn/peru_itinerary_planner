class AddCityReferenceToHotels < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :hotels, :cities
    add_index :hotels, :city_id
    change_column_null :hotels, :city_id, false
  end
end
