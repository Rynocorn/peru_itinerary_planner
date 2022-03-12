require "rails_helper"

RSpec.describe HotelStayResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "hotel_stays",
          attributes: {},
        },
      }
    end

    let(:instance) do
      HotelStayResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { HotelStay.count }.by(1)
    end
  end

  describe "updating" do
    let!(:hotel_stay) { create(:hotel_stay) }

    let(:payload) do
      {
        data: {
          id: hotel_stay.id.to_s,
          type: "hotel_stays",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      HotelStayResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { hotel_stay.reload.updated_at }
      # .and change { hotel_stay.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:hotel_stay) { create(:hotel_stay) }

    let(:instance) do
      HotelStayResource.find(id: hotel_stay.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { HotelStay.count }.by(-1)
    end
  end
end
