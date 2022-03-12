require 'rails_helper'

RSpec.describe "cities#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/cities/#{city.id}"
  end

  describe 'basic destroy' do
    let!(:city) { create(:city) }

    it 'updates the resource' do
      expect(CityResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { City.count }.by(-1)
      expect { city.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
