class Booking < ApplicationRecord
  # Direct associations

  belongs_to :flight

  belongs_to :user

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    user.to_s
  end

end
