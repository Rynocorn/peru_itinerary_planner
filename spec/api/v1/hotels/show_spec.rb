require 'rails_helper'

RSpec.describe "hotels#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/hotels/#{hotel.id}", params: params
  end

  describe 'basic fetch' do
    let!(:hotel) { create(:hotel) }

    it 'works' do
      expect(HotelResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('hotels')
      expect(d.id).to eq(hotel.id)
    end
  end
end
