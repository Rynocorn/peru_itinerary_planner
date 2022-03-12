require "rails_helper"

RSpec.describe "cities#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/cities", params: params
  end

  describe "basic fetch" do
    let!(:city1) { create(:city) }
    let!(:city2) { create(:city) }

    it "works" do
      expect(CityResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["cities"])
      expect(d.map(&:id)).to match_array([city1.id, city2.id])
    end
  end
end
