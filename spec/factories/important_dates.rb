# frozen_string_literal: true

FactoryBot.define do
  factory :important_date, class: 'ImportantDate' do
    event { Faker::Lorem.characters(number: 20) }
    event_date { Faker::Date.in_date_period }
    description { Faker::Lorem.characters(number: 100) }
  end

  factory :invalid_important_date, class: 'ImportantDate' do
    event { Faker::Lorem.characters(number: 1) }
    event_date { Faker::Date.in_date_period }
    description { Faker::Lorem.characters(number: 1) }
  end
end
