class PictureResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :activity_id, :integer
  attribute :picture, :string
  attribute :name, :string

  # Direct associations

  # Indirect associations

end
