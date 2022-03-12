class Flight < ApplicationRecord
  # Direct associations

  has_many   :bookings,
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    origin
  end
end
