require 'rails_helper'

RSpec.describe ActivitySignupResource, type: :resource do
  describe 'serialization' do
    let!(:activity_signup) { create(:activity_signup) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(activity_signup.id)
      expect(data.jsonapi_type).to eq('activity_signups')
    end
  end

  describe 'filtering' do
    let!(:activity_signup1) { create(:activity_signup) }
    let!(:activity_signup2) { create(:activity_signup) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: activity_signup2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([activity_signup2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:activity_signup1) { create(:activity_signup) }
      let!(:activity_signup2) { create(:activity_signup) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            activity_signup1.id,
            activity_signup2.id
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
            activity_signup2.id,
            activity_signup1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
