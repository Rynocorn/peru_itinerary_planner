class HotelResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :city_id, :integer
  attribute :price, :float

  # Direct associations

  belongs_to :city

  has_many   :hotel_stays

  # Indirect associations
end
