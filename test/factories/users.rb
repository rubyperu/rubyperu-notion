FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Fake::Internet.email }
    password { "password" }
  end
end