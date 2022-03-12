class Hotel < ApplicationRecord
  # Direct associations

  belongs_to :city

  has_many   :hotel_stays,
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end
end
