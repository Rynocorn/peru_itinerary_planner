require "rails_helper"

RSpec.describe "pictures#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/pictures/#{picture.id}", params: params
  end

  describe "basic fetch" do
    let!(:picture) { create(:picture) }

    it "works" do
      expect(PictureResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("pictures")
      expect(d.id).to eq(picture.id)
    end
  end
end
