class FlightResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :origin, :string
  attribute :destination, :string
  attribute :date, :date

  # Direct associations

  has_many   :bookings

  # Indirect associations

end
