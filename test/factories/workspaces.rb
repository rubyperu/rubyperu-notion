FactoryBot.define do
  factory :workspace do
    title { Faker::Lorem.sentence }
    association :owner, factory: :user
  end
end