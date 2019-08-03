# frozen_string_literal: true

class Food < ApplicationRecord
  has_many :food_points
  has_many :points, through: :food_points, :dependent => :destroy
  has_many :favorites, :dependent => :destroy
  has_one_attached :image

  validates :name, :description, presence: true
  # validates :points, presence: true

  validates :name, length: { maximum: 10 }
  validates :description, length: { maximum: 300 }
  validates :points, length: { maximum: 3, minmum: 1 }
end
