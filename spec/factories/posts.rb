# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    title { Faker::Lorem.characters(number: 20) }
    content { Faker::Lorem.characters(number: 100) }

    trait :with_user do 
      created_by { create :user }
    end

    trait :invalid_post do
      title { Faker::Lorem.characters(number: 1) }
      content { Faker::Lorem.characters(number: 1) }
    end

  end
end
