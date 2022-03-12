class ActivityResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :date, :datetime
  attribute :city_id, :integer

  # Direct associations

  belongs_to :city

  has_many   :pictures

  has_many   :activity_signups

  # Indirect associations

end
