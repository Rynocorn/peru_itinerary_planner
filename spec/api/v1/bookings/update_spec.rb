require 'rails_helper'

RSpec.describe "bookings#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/bookings/#{booking.id}", payload
  end

  describe 'basic update' do
    let!(:booking) { create(:booking) }

    let(:payload) do
      {
        data: {
          id: booking.id.to_s,
          type: 'bookings',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(BookingResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { booking.reload.attributes }
    end
  end
end
