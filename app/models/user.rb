class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.gest
    find_or_create_by(email: 'gest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end
  # 簡単ログイン機能を実装

  has_many :reviews, dependent: :destroy
  validates :email, presence: true
  validates :email, length: { maximum: 50 }
  validates :email, uniqueness: true
  validates :nickname, presence: true, length: { maximum: 15 }

  has_one_attached :avator
end
