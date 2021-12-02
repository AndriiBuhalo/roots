# frozen_string_literal: true

FactoryBot.define do
  factory :attachment, class: 'Attachment' do
    file { Faker::File.file_name(dir: 'spec/fixtures/attachment/test.jpg') }

    trait :invalid_attachment do
      file { Faker::File.file_name(dir: 'spec/fixtures/attachment/test.jpg') }
    end
  end
end
