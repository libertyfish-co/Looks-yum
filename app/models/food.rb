# frozen_string_literal: true

# 食材クラス
class Food < ApplicationRecord
  has_many :food_points, dependent: :destroy
  has_many :points, through: :food_points, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one_attached :image

  validates :name, :description, presence: true
  validates :points, presence: { message: 'select please' }

  validates :image, attached: true

  validates :name, length: { maximum: 10 }
  validates :description, length: { maximum: 300 }
  validates :points, length: { maximum: 3, minmum: 1 }

  def self.build(food_params, point_ids)
    food = Food.new(food_params)
    (point_ids || []).each do |point_id|
      food.points << Point.find(point_id)
    end
    food
  end
end
