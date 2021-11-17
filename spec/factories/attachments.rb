FactoryBot.define do
  factory :attachment do
    #file fixture_file_upload( Rails.root + 'spec/fixtures/attachment/test.jpg', "image/jpg")
    title { Faker::Lorem.characters(number: 10) }
  end
end
