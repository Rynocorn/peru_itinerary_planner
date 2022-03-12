require "rails_helper"

RSpec.describe "hotel_stays#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/hotel_stays/#{hotel_stay.id}"
  end

  describe "basic destroy" do
    let!(:hotel_stay) { create(:hotel_stay) }

    it "updates the resource" do
      expect(HotelStayResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { HotelStay.count }.by(-1)
      expect { hotel_stay.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
