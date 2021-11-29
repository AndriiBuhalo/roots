# frozen_string_literal: true

FactoryBot.define do
  factory :attachment, class: 'Attachment' do
    keyword { Faker::Lorem.characters(number: 10) }
    notes { Faker::Lorem.characters(number: 15) }
    place { Faker::Lorem.characters(number: 20) }
    file { Faker::File.file_name(dir: 'spec/fixtures/attachment/test.jpg') }
  end

  factory :invalid_attachment, class: 'Attachment' do
    keyword { Faker::Lorem.characters(number: 1) }
    notes { Faker::Lorem.characters(number: 1) }
    place { Faker::Lorem.characters(number: 1) }
  end
end
