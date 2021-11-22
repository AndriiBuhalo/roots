# frozen_string_literal: true

FactoryBot.define do
  factory :post, class: 'Post' do
    title { Faker::Lorem.characters(number: 20) }
    content { Faker::Lorem.characters(number: 100) }
  end

  factory :invalid_post, class: 'Post' do
    title { Faker::Lorem.characters(number: 1) }
    content { Faker::Lorem.characters(number: 1) }
  end
end