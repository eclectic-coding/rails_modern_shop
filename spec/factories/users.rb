FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "Example User_#{n}" }
    email { Faker::Internet.email }
    password { "password" }
    password_confirmation { "password" }

    trait :admin do
      role { :admin }
    end
  end
end
