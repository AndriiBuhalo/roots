# frozen_string_literal: true

FactoryBot.define do
  factory :attachment do
    file { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/files/test.jpg')) }

    trait :with_user do
      created_by { create :user }
    end

    trait :invalid_attachment do
      file { '' }
    end
  end
end
