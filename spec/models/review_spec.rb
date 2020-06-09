require 'rails_helper'

RSpec.describe Review, type: :model do
  it 'create review' do
    expect(FactoryBot.create(:review)).to be_valid
  end

  it 'not allow review is nil' do
    review = FactoryBot.build(:review, review: nil)
    review.valid?
    expect(review.errors[:review]).to include("can't be blank")
  end
end
