require 'rails_helper'

RSpec.describe "hotels#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/hotels", params: params
  end

  describe 'basic fetch' do
    let!(:hotel1) { create(:hotel) }
    let!(:hotel2) { create(:hotel) }

    it 'works' do
      expect(HotelResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['hotels'])
      expect(d.map(&:id)).to match_array([hotel1.id, hotel2.id])
    end
  end
end
