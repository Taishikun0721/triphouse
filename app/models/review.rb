class Review < ApplicationRecord
  belongs_to :user
  belongs_to :place

  validates :review, presence: true
end
