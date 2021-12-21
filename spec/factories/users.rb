# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { Faker::Internet.user_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }

    trait :admin do
      role { :admin }
    end
  end
end
