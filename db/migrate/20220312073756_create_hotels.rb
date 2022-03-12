class CreateHotels < ActiveRecord::Migration[6.0]
  def change
    create_table :hotels do |t|
      t.string :name
      t.integer :city_id
      t.float :price

      t.timestamps
    end
  end
end
