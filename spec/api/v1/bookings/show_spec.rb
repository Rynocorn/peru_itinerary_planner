require 'rails_helper'

RSpec.describe "bookings#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/bookings/#{booking.id}", params: params
  end

  describe 'basic fetch' do
    let!(:booking) { create(:booking) }

    it 'works' do
      expect(BookingResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('bookings')
      expect(d.id).to eq(booking.id)
    end
  end
end
