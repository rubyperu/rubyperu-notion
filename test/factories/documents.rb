FactoryBot.define do
  factory :document do
      title { Faker::Lorem.sentence }
      association :owner, factory: :user
      association :workspace
  end
end