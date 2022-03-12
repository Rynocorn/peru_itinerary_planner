class City < ApplicationRecord
  # Direct associations

  has_many   :hotels,
             dependent: :destroy

  has_many   :activities,
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end
end
