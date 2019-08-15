# frozen_string_literal: true

FactoryBot.define do
  factory :food do
    sequence(:name) { |n| "name #{n}" }
    sequence(:description) { |n| "description #{n}" }

    after(:build) do |food|
      food.image do
        fixture_file_upload(
          Rails.root.join('spec', 'fixtures', 'cabbage.jpg'), 'image/jpeg'
        )
      end
    end

    after(:create) do |food|
      create(:food_point, food: food, point: create(:point))
    end
  end
end
