# frozen_string_literal: true

class CreatePoints < ActiveRecord::Migration[5.2]
  def change
    create_table :points do |t|
      t.string :point

      t.timestamps
    end
  end
end
