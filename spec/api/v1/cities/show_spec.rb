require 'rails_helper'

RSpec.describe "cities#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/cities/#{city.id}", params: params
  end

  describe 'basic fetch' do
    let!(:city) { create(:city) }

    it 'works' do
      expect(CityResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('cities')
      expect(d.id).to eq(city.id)
    end
  end
end
