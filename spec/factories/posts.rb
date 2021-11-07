FactoryBot.define do

  factory :post, class: Post do
    title { Faker::Lorem.characters(number: 40) }
    content { Faker::Lorem.characters(number: 65) }
  end


end
