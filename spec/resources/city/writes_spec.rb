require 'rails_helper'

RSpec.describe CityResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'cities',
          attributes: { }
        }
      }
    end

    let(:instance) do
      CityResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { City.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:city) { create(:city) }

    let(:payload) do
      {
        data: {
          id: city.id.to_s,
          type: 'cities',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      CityResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { city.reload.updated_at }
      # .and change { city.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:city) { create(:city) }

    let(:instance) do
      CityResource.find(id: city.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { City.count }.by(-1)
    end
  end
end
