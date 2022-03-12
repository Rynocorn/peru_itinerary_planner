require 'rails_helper'

RSpec.describe "cities#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/cities/#{city.id}", payload
  end

  describe 'basic update' do
    let!(:city) { create(:city) }

    let(:payload) do
      {
        data: {
          id: city.id.to_s,
          type: 'cities',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(CityResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { city.reload.attributes }
    end
  end
end
