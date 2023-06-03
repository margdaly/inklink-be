FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    city { Faker::Address.city }
    username { Faker::Internet.unique.email }
    password { Faker::Internet.password }
  end
end
