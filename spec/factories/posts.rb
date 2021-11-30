# frozen_string_literal: true

FactoryBot.define do
  factory :post, class: 'Post' do
    title { Faker::Lorem.characters(number: 20) }
    content { Faker::Lorem.characters(number: 100) }
    created_by { user }

    trait :invalid_post do
      title { Faker::Lorem.characters(number: 1) }
      content { Faker::Lorem.characters(number: 1) }
      created_by { user }
    end
  end
end
