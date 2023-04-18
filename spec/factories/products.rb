FactoryBot.define do
  factory :product do
    title { "MyString" }
    price { "9.99" }
    description { "MyText" }
    stock { "MyString" }
    quantity { 1 }
    category { Category.first }

    after(:build) do |product|
      product.product_img.attach(
        io: File.open(Rails.root.join("spec", "support", "assets", "image.png")),
        filename: "image.png",
        content_type: "image/png"
      )
    end
  end
end
