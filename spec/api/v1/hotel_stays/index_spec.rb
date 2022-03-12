require "rails_helper"

RSpec.describe "hotel_stays#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/hotel_stays", params: params
  end

  describe "basic fetch" do
    let!(:hotel_stay1) { create(:hotel_stay) }
    let!(:hotel_stay2) { create(:hotel_stay) }

    it "works" do
      expect(HotelStayResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["hotel_stays"])
      expect(d.map(&:id)).to match_array([hotel_stay1.id, hotel_stay2.id])
    end
  end
end
