# frozen_string_literal: true

FactoryBot.define do
  factory :album, class: 'Album' do
    name { Faker::Name.initials(number: 10) }
    description { Faker::Hobby.activity }

    trait :invalid_album do
      name { Faker::Name.initials(number: 1) }
      description { Faker::Name.initials(number: 1) }
    end
  end
end
