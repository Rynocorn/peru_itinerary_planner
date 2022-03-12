require "rails_helper"

RSpec.describe HotelResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "hotels",
          attributes: {},
        },
      }
    end

    let(:instance) do
      HotelResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Hotel.count }.by(1)
    end
  end

  describe "updating" do
    let!(:hotel) { create(:hotel) }

    let(:payload) do
      {
        data: {
          id: hotel.id.to_s,
          type: "hotels",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      HotelResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { hotel.reload.updated_at }
      # .and change { hotel.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:hotel) { create(:hotel) }

    let(:instance) do
      HotelResource.find(id: hotel.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Hotel.count }.by(-1)
    end
  end
end
