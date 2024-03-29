FactoryBot.define do
  factory :product do
    sequence(:title) { |n| "Product_#{n}" }
    description { "MyText" }
    price { 9.99 }
    category_id { create(:category).id }
    quantity { rand(8) }
    stock { SecureRandom.hex(12) }
    product_available { true }

    after(:build) do |product|
      product.product_img.attach(
        io: File.open(Rails.root.join("spec", "support", "assets", "image.jpg")),
        filename: "image.jpg",
        content_type: "image/jpeg"
      )
    end
  end
end
