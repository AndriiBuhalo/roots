# frozen_string_literal: true

FactoryBot.define do
  factory :album, class: 'Album' do
    name { Faker::Lorem.characters(number: 10) }
    description { Faker::Lorem.characters(number: 65) }
  end

  factory :invalid_album, class: 'Album' do
    name { Faker::Lorem.characters(number: 1) }
    description { Faker::Lorem.characters(number: 1) }
  end
end
