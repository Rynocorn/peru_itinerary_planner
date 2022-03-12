class AddUserReferenceToHotelStays < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :hotel_stays, :users
    add_index :hotel_stays, :user_id
    change_column_null :hotel_stays, :user_id, false
  end
end
