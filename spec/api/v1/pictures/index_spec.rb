require "rails_helper"

RSpec.describe "pictures#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/pictures", params: params
  end

  describe "basic fetch" do
    let!(:picture1) { create(:picture) }
    let!(:picture2) { create(:picture) }

    it "works" do
      expect(PictureResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["pictures"])
      expect(d.map(&:id)).to match_array([picture1.id, picture2.id])
    end
  end
end
