class CreateHotelStays < ActiveRecord::Migration[6.0]
  def change
    create_table :hotel_stays do |t|
      t.integer :hotel_id
      t.integer :user_id

      t.timestamps
    end
  end
end
