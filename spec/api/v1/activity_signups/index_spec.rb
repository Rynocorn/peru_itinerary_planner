require 'rails_helper'

RSpec.describe "activity_signups#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/activity_signups", params: params
  end

  describe 'basic fetch' do
    let!(:activity_signup1) { create(:activity_signup) }
    let!(:activity_signup2) { create(:activity_signup) }

    it 'works' do
      expect(ActivitySignupResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['activity_signups'])
      expect(d.map(&:id)).to match_array([activity_signup1.id, activity_signup2.id])
    end
  end
end
