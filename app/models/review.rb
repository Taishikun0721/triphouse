class Review < ApplicationRecord
  belongs_to :user
  belongs_to :place

  validates :review, presence: true
  validates :user_id, presence: true
  validates :place_id, presence: true
end
