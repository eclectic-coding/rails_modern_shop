FactoryBot.define do
  factory :product do
    title { "MyString" }
    price { "9.99" }
    description { "MyText" }
    image { "MyString" }
    stock { "MyString" }
    quantity { 1 }
    category { nil }
  end
end
