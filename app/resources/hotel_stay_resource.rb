class HotelStayResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :hotel_id, :integer
  attribute :user_id, :integer

  # Direct associations

  belongs_to :hotel

  belongs_to :user

  # Indirect associations
end
