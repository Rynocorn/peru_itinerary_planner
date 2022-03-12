require 'rails_helper'

RSpec.describe "activity_signups#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/activity_signups", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'activity_signups',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(ActivitySignupResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { ActivitySignup.count }.by(1)
    end
  end
end
