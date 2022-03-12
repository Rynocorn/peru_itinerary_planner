require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:hotels) }

    it { should have_many(:activity_signups) }

    it { should have_many(:bookings) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
