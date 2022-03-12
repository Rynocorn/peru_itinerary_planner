require "rails_helper"

RSpec.describe "hotel_stays#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/hotel_stays/#{hotel_stay.id}", params: params
  end

  describe "basic fetch" do
    let!(:hotel_stay) { create(:hotel_stay) }

    it "works" do
      expect(HotelStayResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("hotel_stays")
      expect(d.id).to eq(hotel_stay.id)
    end
  end
end
