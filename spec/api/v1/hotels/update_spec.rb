require "rails_helper"

RSpec.describe "hotels#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/hotels/#{hotel.id}", payload
  end

  describe "basic update" do
    let!(:hotel) { create(:hotel) }

    let(:payload) do
      {
        data: {
          id: hotel.id.to_s,
          type: "hotels",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(HotelResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { hotel.reload.attributes }
    end
  end
end
