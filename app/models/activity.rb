class Activity < ApplicationRecord
  # Direct associations

  belongs_to :city

  has_many   :pictures,
             :dependent => :destroy

  has_many   :activity_signups,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end

end
