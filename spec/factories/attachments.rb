# frozen_string_literal: true

FactoryBot.define do
  factory :attachment do
    file { Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/attachment/test.jpg'))) }

    trait :with_user do
      created_by { create :user }
    end

    trait :invalid_attachment do
      file { Faker::Lorem.characters(number: 1) }
    end
  end
end
