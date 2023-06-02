FactoryBot.define do
  factory :user do
    name { Faker::Name.name  }
    city { Faker::Address.city  }
    username { Faker::Internet.email.unique.clear  }
    password_digest { Faker::Internet.password  }
  end
end
