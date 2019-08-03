# frozen_string_literal: true

class Point < ApplicationRecord
  has_many :food_points, :dependent => :destroy

  validates :point, presence: true
  validates :point, length: { maximum: 20 }
end
