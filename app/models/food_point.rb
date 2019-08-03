# frozen_string_literal: true

class FoodPoint < ApplicationRecord
  belongs_to :point
  belongs_to :food

  validates :food_id, :point_id, presence: true
end
