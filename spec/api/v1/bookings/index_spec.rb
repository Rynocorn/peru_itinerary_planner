require "rails_helper"

RSpec.describe "bookings#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/bookings", params: params
  end

  describe "basic fetch" do
    let!(:booking1) { create(:booking) }
    let!(:booking2) { create(:booking) }

    it "works" do
      expect(BookingResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["bookings"])
      expect(d.map(&:id)).to match_array([booking1.id, booking2.id])
    end
  end
end
