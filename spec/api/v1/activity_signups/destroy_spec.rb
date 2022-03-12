require 'rails_helper'

RSpec.describe "activity_signups#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/activity_signups/#{activity_signup.id}"
  end

  describe 'basic destroy' do
    let!(:activity_signup) { create(:activity_signup) }

    it 'updates the resource' do
      expect(ActivitySignupResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { ActivitySignup.count }.by(-1)
      expect { activity_signup.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
