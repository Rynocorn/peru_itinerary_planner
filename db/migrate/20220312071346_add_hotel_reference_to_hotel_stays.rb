class AddHotelReferenceToHotelStays < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :hotel_stays, :hotels
    add_index :hotel_stays, :hotel_id
    change_column_null :hotel_stays, :hotel_id, false
  end
end
