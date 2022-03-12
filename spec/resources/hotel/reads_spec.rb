require 'rails_helper'

RSpec.describe HotelResource, type: :resource do
  describe 'serialization' do
    let!(:hotel) { create(:hotel) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(hotel.id)
      expect(data.jsonapi_type).to eq('hotels')
    end
  end

  describe 'filtering' do
    let!(:hotel1) { create(:hotel) }
    let!(:hotel2) { create(:hotel) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: hotel2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([hotel2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:hotel1) { create(:hotel) }
      let!(:hotel2) { create(:hotel) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            hotel1.id,
            hotel2.id
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
            hotel2.id,
            hotel1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
