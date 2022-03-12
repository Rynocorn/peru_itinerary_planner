require 'rails_helper'

RSpec.describe CityResource, type: :resource do
  describe 'serialization' do
    let!(:city) { create(:city) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(city.id)
      expect(data.jsonapi_type).to eq('cities')
    end
  end

  describe 'filtering' do
    let!(:city1) { create(:city) }
    let!(:city2) { create(:city) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: city2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([city2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:city1) { create(:city) }
      let!(:city2) { create(:city) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            city1.id,
            city2.id
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
            city2.id,
            city1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
