require "rails_helper"

RSpec.describe Flight, type: :model do
  describe "Direct Associations" do
    it { should have_many(:bookings) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
