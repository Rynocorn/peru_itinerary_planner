require "rails_helper"

RSpec.describe "pictures#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/pictures/#{picture.id}"
  end

  describe "basic destroy" do
    let!(:picture) { create(:picture) }

    it "updates the resource" do
      expect(PictureResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Picture.count }.by(-1)
      expect { picture.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
