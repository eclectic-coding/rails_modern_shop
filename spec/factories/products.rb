FactoryBot.define do
  factory :product do
    title { "MyString" }
    price { "9.99" }
    quantity { 1 }
    description { "MyText" }
    stock { SecureRandom.hex(12) }
    category_id { create(:category).id }
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
