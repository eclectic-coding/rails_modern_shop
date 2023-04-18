FactoryBot.define do
  factory :product do
    title { "MyString" }
    price { "9.99" }
    description { "MyText" }
    stock { SecureRandom.hex(12) }
    quantity { 1 }
    association :category

    after(:build) do |product|
      product.product_img.attach(
        io: File.open(Rails.root.join("spec", "support", "assets", "image.png")),
        filename: "image.png",
        content_type: "image/png"
      )
    end
  end
end
