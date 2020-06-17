require 'rails_helper'

RSpec.describe 'Places', type: :request do
  describe 'index' do
    it '200番レスポンスが返却される' do
      sign_in @user
      get root_path
      expect(response).to have_http_status(302)
    end
  end

  describe 'show' do
    before do
      @user = FactoryBot.create(:user)
      @place = FactoryBot.create(:place)
    end

    context 'サインイン済みユーザーの場合' do
      it '正常にレスポンスが返される' do
        sign_in @user
        get place_path @place.id
        expect(response).to be_success
      end

      context '未認証ユーザーの場合' do
        it 'レスポンスは返却されない' do
          get place_path @place.id
          expect(response).to_not be_success
        end
      end
    end
  end
end
