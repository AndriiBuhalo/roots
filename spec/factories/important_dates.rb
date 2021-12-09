# frozen_string_literal: true

FactoryBot.define do
  factory :important_date do
    event_name { Faker::Lorem.characters(number: 50) }
    event_date { Faker::Date.in_date_period }
    description { Faker::Lorem.characters(number: 100) }

    trait :with_user do
      created_by { create :user }
    end

    trait :invalid_important_date do
      event_name { Faker::Lorem.characters(number: 1) }
      event_date { Faker::Date.in_date_period }
      description { Faker::Lorem.characters(number: 1) }
    end
  end
end
