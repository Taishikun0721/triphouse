require 'rails_helper'

RSpec.describe "Places", type: :request do
  describe "index" do
    it "responds succeessfully" do
      get root_path
      expect(response).to have_http_status(200)
    end
  end

  describe "show" do
    before do
      @user = FactoryBot.create(:user)
      @place = FactoryBot.create(:place)
    end

    context "as an authorize user" do
      it "responds succeessfully" do
        sign_in @user
        get place_path @place.id
        expect(response).to be_success
      end

      context "as an unauthorize user" do
        it "responds not succeessfully" do
          get place_path @place.id
          expect(response).to_not be_success
        end
      end
    end

  end

end
