require 'rails_helper'

RSpec.describe BookingResource, type: :resource do
  describe 'serialization' do
    let!(:booking) { create(:booking) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(booking.id)
      expect(data.jsonapi_type).to eq('bookings')
    end
  end

  describe 'filtering' do
    let!(:booking1) { create(:booking) }
    let!(:booking2) { create(:booking) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: booking2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([booking2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:booking1) { create(:booking) }
      let!(:booking2) { create(:booking) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            booking1.id,
            booking2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            booking2.id,
            booking1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
