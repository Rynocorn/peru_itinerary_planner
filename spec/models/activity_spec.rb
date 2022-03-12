require "rails_helper"

RSpec.describe Activity, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:city) }

    it { should have_many(:pictures) }

    it { should have_many(:activity_signups) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
