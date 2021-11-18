FactoryBot.define do
  factory :attachment do
    notes { Faker::Lorem.characters(number: 3) }
    #file: Rack::Test::UploadedFile.new('spec/fixtures/attachment/test.jpg', 'image/jpg')
  end
end
