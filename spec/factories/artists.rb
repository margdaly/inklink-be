FactoryBot.define do
  factory :artist do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    password_confirmation { password }
    styles { ["American Traditional", "Watercolor"] }
    pricing { "$" + Faker::Number.between(from: 1, to: 3).to_s } 
    contact_info { Faker::PhoneNumber.cell_phone }
  end
end
