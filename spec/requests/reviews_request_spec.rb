require 'rails_helper'

RSpec.describe "Reviews", type: :request do
    before do
      @user = FactoryBot.create(:user)
      @place = FactoryBot.create(:place)
      @review = FactoryBot.create(:review)
    end

    # describe "destroy" do
    #   it "make sure succeessfully delete method" do
    #     sign_in @user
    #     delete place_review_path @place.id @review.id
    #     expect(response).to have_http_status(200)
    #   end
    # end
    #作成途中
end
