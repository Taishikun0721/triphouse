class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         def new_gest
           user = User.new_gest
           sign_in user
           redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
         end
end
