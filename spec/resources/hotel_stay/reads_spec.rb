require "rails_helper"

RSpec.describe HotelStayResource, type: :resource do
  describe "serialization" do
    let!(:hotel_stay) { create(:hotel_stay) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(hotel_stay.id)
      expect(data.jsonapi_type).to eq("hotel_stays")
    end
  end

  describe "filtering" do
    let!(:hotel_stay1) { create(:hotel_stay) }
    let!(:hotel_stay2) { create(:hotel_stay) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: hotel_stay2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([hotel_stay2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:hotel_stay1) { create(:hotel_stay) }
      let!(:hotel_stay2) { create(:hotel_stay) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      hotel_stay1.id,
                                      hotel_stay2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      hotel_stay2.id,
                                      hotel_stay1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
