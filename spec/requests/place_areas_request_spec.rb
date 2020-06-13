require 'rails_helper'

RSpec.describe 'PlaceAreas', type: :request do
  before do
    @user = FactoryBot.create(:user)
    @placearea = FactoryBot.create(:place_area)
  end

  describe 'show' do
    context "サインインされている場合" do
      it "国別のplaceが表示される" do
        sign_in @user
        get place_area_path @placearea.id
        expect(response).to have_http_status(200)
      end
    end
  end
end
