class AddFlightReferenceToBookings < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :bookings, :flights
    add_index :bookings, :flight_id
    change_column_null :bookings, :flight_id, false
  end
end
