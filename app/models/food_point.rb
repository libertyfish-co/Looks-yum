# frozen_string_literal: true

# 食材と見分け方の中間クラス
class FoodPoint < ApplicationRecord
  belongs_to :point
  belongs_to :food

  validates :food_id, :point_id, presence: true
end
