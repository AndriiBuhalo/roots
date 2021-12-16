FactoryBot.define do
  factory :location do
    name { Faker::Address.city }
    address { Faker::Address.full_address }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }

    trait :with_user do
      created_by { create :user }
    end

    trait :invalid_location do
      name { Faker::Lorem.characters(number: 1) }
      address { Faker::Lorem.characters(number: 3) }
      latitude { Faker::Lorem.characters(number: 5) }
      longitude { Faker::Lorem.characters(number: 5) }
    end
  end
end
