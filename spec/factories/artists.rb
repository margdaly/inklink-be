FactoryBot.define do
  factory :artist do
    name { Faker::Name.name }
    username { Faker::Internet.email.unique.clear }
    password_digest { Faker::Internet.password }
    styles { ["American Traditional", "Watercolor"] }
    pricing { "$" + Faker::Number.between(from: 1, to: 3).to_s } 
    contact_info { Faker::PhoneNumber.cell_phone }
  end
end
