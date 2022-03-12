require "rails_helper"

RSpec.describe Hotel, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:city) }

    it { should have_many(:hotel_stays) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
