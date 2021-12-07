# frozen_string_literal: true

FactoryBot.define do
  factory :attachment do
    file { Faker::File.file_name(dir: 'path/to') }

    trait :with_user do
      created_by { create :user }
    end

    trait :invalid_attachment do
      file { Faker::Lorem.characters(number: 1) }
    end
  end
end
