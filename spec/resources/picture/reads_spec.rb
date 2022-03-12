require "rails_helper"

RSpec.describe PictureResource, type: :resource do
  describe "serialization" do
    let!(:picture) { create(:picture) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(picture.id)
      expect(data.jsonapi_type).to eq("pictures")
    end
  end

  describe "filtering" do
    let!(:picture1) { create(:picture) }
    let!(:picture2) { create(:picture) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: picture2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([picture2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:picture1) { create(:picture) }
      let!(:picture2) { create(:picture) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      picture1.id,
                                      picture2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      picture2.id,
                                      picture1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
