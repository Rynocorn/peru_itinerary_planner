require "rails_helper"

RSpec.describe "pictures#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/pictures/#{picture.id}", payload
  end

  describe "basic update" do
    let!(:picture) { create(:picture) }

    let(:payload) do
      {
        data: {
          id: picture.id.to_s,
          type: "pictures",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(PictureResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { picture.reload.attributes }
    end
  end
end
