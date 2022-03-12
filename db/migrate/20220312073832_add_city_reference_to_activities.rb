class AddCityReferenceToActivities < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :activities, :cities
    add_index :activities, :city_id
    change_column_null :activities, :city_id, false
  end
end
