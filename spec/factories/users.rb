FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "Example User_#{n}" }
    sequence(:email) { |n| "user_#{n}@example.com" }
    password { "password" }
    password_confirmation { "password" }

    trait :admin do
      role { :admin }
    end
  end
end
