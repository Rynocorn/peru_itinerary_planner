require "rails_helper"

RSpec.describe "hotel_stays#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/hotel_stays/#{hotel_stay.id}", payload
  end

  describe "basic update" do
    let!(:hotel_stay) { create(:hotel_stay) }

    let(:payload) do
      {
        data: {
          id: hotel_stay.id.to_s,
          type: "hotel_stays",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(HotelStayResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { hotel_stay.reload.attributes }
    end
  end
end
