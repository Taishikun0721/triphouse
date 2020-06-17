require 'rails_helper'

RSpec.describe Review, type: :model do
  context 'バリデーションチェック' do

    it 'review作成' do
      expect(FactoryBot.create(:review)).to be_valid
    end

    it '空白でレビューは作成できない' do
      review = FactoryBot.build(:review, review: nil)
      review.valid?
      expect(review.errors[:review]).to include("can't be blank")
    end
  end
end
