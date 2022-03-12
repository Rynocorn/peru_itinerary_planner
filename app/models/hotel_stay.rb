class HotelStay < ApplicationRecord
  # Direct associations

  belongs_to :hotel

  belongs_to :user

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    hotel.to_s
  end
end
