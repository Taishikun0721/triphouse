require 'rails_helper'

RSpec.describe User, type: :model do
  context "valid test" do
    it "has a valid factory" do
      expect(FactoryBot.build(:user)).to be_valid
    end

    it "valid without password" do
      user = FactoryBot.build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "valid without email" do
      user = FactoryBot.build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
  end

  context "method test" do
    it "work login as a gestuser" do
       expect(FactoryBot.create(:user, email: "gest@example.com", password: SecureRandom.urlsafe_base64)).to be_valid
    end
  end

end
