FactoryBot.define do
  factory :artist do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    password_confirmation { password }
    styles { ["Watercolor", "American Traditional", "Geometric", "Script", "Black and Gray", "Realism", "Tribal", "Chicano", "Irezumi", "New School"].sample(2) }
    pricing { "$" + Faker::Number.between(from: 10, to: 1000).to_s } 
  end
end
