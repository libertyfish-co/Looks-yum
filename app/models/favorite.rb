class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :food

  validates :user_id, :food_id, presence: true
end
