class Picture < ApplicationRecord
  # Direct associations

  belongs_to :activity

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    activity.to_s
  end

end
