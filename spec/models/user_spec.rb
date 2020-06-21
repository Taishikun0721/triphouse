require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { FactoryBot.build(:user) }

  context 'バリデーションテスト' do
    it 'ファクトリーボットの動作テスト' do
      expect(user).to be_valid
    end

    it 'パスワードの空白禁止' do
      user.password = nil
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it 'メールアドレスの空白禁止' do
      user.email = nil
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'メールアドレスがユニークな値であること' do
      FactoryBot.create(:user, email: 'test@example.com')
      other_user = FactoryBot.build(:user, email: 'test@example.com')
      other_user.valid?
      expect(other_user.errors[:email]).to include('has already been taken')
    end

    it 'ニックネームが空白でないこと' do
      user.nickname = nil
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end
  end

  context 'メソッドテスト' do
    it '簡単ログイン機能が動作しているか' do
      expect(FactoryBot.create(:user, email: 'gest@example.com', password: SecureRandom.urlsafe_base64)).to be_valid
    end
  end
end
