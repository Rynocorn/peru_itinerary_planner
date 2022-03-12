require "rails_helper"

RSpec.describe ActivitySignupResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "activity_signups",
          attributes: {},
        },
      }
    end

    let(:instance) do
      ActivitySignupResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { ActivitySignup.count }.by(1)
    end
  end

  describe "updating" do
    let!(:activity_signup) { create(:activity_signup) }

    let(:payload) do
      {
        data: {
          id: activity_signup.id.to_s,
          type: "activity_signups",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      ActivitySignupResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { activity_signup.reload.updated_at }
      # .and change { activity_signup.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:activity_signup) { create(:activity_signup) }

    let(:instance) do
      ActivitySignupResource.find(id: activity_signup.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { ActivitySignup.count }.by(-1)
    end
  end
end
