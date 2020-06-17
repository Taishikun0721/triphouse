require 'rails_helper'


RSpec.describe 'Users', type: :request do

  before do
    @user = FactoryBot.create(:user)
    @placearea = FactoryBot.create(:place_area)
  end

  describe 'GET /show' do
    context "認証されているユーザー" do
      it '200番レスポンスが返ってくる' do
        sign_in @user
        get user_path @placearea.id
        expect(response).to have_http_status(:success)
      end
    end
  end
end
