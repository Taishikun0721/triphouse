class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.new_gest
    find_or_create_by(email: 'gest@example.com') do |user|
    user.password = SecureRandom.urlsafe_base64
    end
  end

  has_many :reviews, dependent: :destroy
end
