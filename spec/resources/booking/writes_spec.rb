require "rails_helper"

RSpec.describe BookingResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "bookings",
          attributes: {},
        },
      }
    end

    let(:instance) do
      BookingResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Booking.count }.by(1)
    end
  end

  describe "updating" do
    let!(:booking) { create(:booking) }

    let(:payload) do
      {
        data: {
          id: booking.id.to_s,
          type: "bookings",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      BookingResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { booking.reload.updated_at }
      # .and change { booking.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:booking) { create(:booking) }

    let(:instance) do
      BookingResource.find(id: booking.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Booking.count }.by(-1)
    end
  end
end
