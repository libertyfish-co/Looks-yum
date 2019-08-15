# frozen_string_literal: true

FactoryBot.define do
  factory :point do
    sequence(:point) { |n| "point #{n}" }
  end
end
