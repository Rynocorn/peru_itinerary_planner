require 'rails_helper'

RSpec.describe "activity_signups#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/activity_signups/#{activity_signup.id}", payload
  end

  describe 'basic update' do
    let!(:activity_signup) { create(:activity_signup) }

    let(:payload) do
      {
        data: {
          id: activity_signup.id.to_s,
          type: 'activity_signups',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(ActivitySignupResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { activity_signup.reload.attributes }
    end
  end
end
