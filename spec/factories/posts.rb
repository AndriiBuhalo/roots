FactoryBot.define do
  factory :post, class: Post do
    title { Faker::Lorem.title }
    content { Faker::Lorem.characters }
  end
end
