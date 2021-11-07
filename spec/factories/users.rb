FactoryBot.define do
  factory :user do
    username {Faker::Name.username}
    email {Faker::Internet.email}
    password {Faker::Internet.password(min_length: 6)}
  end
end
