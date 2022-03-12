require "rails_helper"

RSpec.describe PictureResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "pictures",
          attributes: {},
        },
      }
    end

    let(:instance) do
      PictureResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Picture.count }.by(1)
    end
  end

  describe "updating" do
    let!(:picture) { create(:picture) }

    let(:payload) do
      {
        data: {
          id: picture.id.to_s,
          type: "pictures",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      PictureResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { picture.reload.updated_at }
      # .and change { picture.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:picture) { create(:picture) }

    let(:instance) do
      PictureResource.find(id: picture.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Picture.count }.by(-1)
    end
  end
end
