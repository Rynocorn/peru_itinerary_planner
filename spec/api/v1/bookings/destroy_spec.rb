require 'rails_helper'

RSpec.describe "bookings#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/bookings/#{booking.id}"
  end

  describe 'basic destroy' do
    let!(:booking) { create(:booking) }

    it 'updates the resource' do
      expect(BookingResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Booking.count }.by(-1)
      expect { booking.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
