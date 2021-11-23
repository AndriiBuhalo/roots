# frozen_string_literal: true

FactoryBot.define do
  factory :attachment do
    notes { Faker::Lorem.characters(number: 3) }
    Faker::File.file_name(dir: 'spec/fixtures/attachment/test.jpg')
  end
end
