FactoryBot.define do
  factory :user do
    name { "Example User" }
    email { Faker::Internet.email }
    password { "password" }
    password_confirmation { "password" }

    trait :admin do
      role { :admin }
    end
  end
end
