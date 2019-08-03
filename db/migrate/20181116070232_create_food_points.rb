# frozen_string_literal: true

class CreateFoodPoints < ActiveRecord::Migration[5.2]
  def change
    create_table :food_points do |t|
      t.references :food, foreign_key: true
      t.references :point, foreign_key: true

      t.timestamps
    end
  end
end
