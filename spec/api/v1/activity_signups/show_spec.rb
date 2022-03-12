require 'rails_helper'

RSpec.describe "activity_signups#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/activity_signups/#{activity_signup.id}", params: params
  end

  describe 'basic fetch' do
    let!(:activity_signup) { create(:activity_signup) }

    it 'works' do
      expect(ActivitySignupResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('activity_signups')
      expect(d.id).to eq(activity_signup.id)
    end
  end
end
