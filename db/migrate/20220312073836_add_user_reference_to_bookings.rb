class AddUserReferenceToBookings < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :bookings, :users
    add_index :bookings, :user_id
    change_column_null :bookings, :user_id, false
  end
end
