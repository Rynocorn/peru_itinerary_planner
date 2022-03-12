require "rails_helper"

RSpec.describe "hotels#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/hotels/#{hotel.id}"
  end

  describe "basic destroy" do
    let!(:hotel) { create(:hotel) }

    it "updates the resource" do
      expect(HotelResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Hotel.count }.by(-1)
      expect { hotel.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
