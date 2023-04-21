require "securerandom"

class DatabaseSeederJob < ApplicationJob
  queue_as :default

  DEFAULT_USER_EMAIL = "admin@example.com"
  DEFAULT_USER_PASSWORD = "Mysecret+1234"

  def perform
    ActiveRecord::Base.transaction do
      create_admin_user
      create_customer_user
      create_categories
      create_products
      save_original_imgs
    end
  end

  private

  def create_admin_user
    User.create!(
      name: "Admin User",
      email: DEFAULT_USER_EMAIL,
      password: DEFAULT_USER_PASSWORD,
      password_confirmation: DEFAULT_USER_PASSWORD,
      role: "admin"
    )
  end

  def create_customer_user
    User.create!(
      name: "Customer User",
      email: "customer@example.com",
      password: DEFAULT_USER_PASSWORD,
      password_confirmation: DEFAULT_USER_PASSWORD
    )
  end

  def create_categories
    category_response = Faraday.get "https://fakestoreapi.com/products/categories"

    categories = JSON.parse(category_response.body)

    categories.each do |category|
      Category.find_or_create_by(
        name: category.tr(" ", "_").delete("'")
      )
    end
  end

  def create_products
    product_response = Faraday.get "https://fakestoreapi.com/products"
    products = JSON.parse(product_response.body)

    products.each do |product|
      Product.find_or_create_by!(
        title: product["title"],
        price: product["price"],
        description: product["description"],
        category: Category.find_by(name: product["category"].tr(" ", "_").delete("'")),
        image: product["image"],
        quantity: rand(1..10)
      )
    end
  end

  def save_original_imgs
    Product.all.each do |product|
      url = URI.parse(product.image)
      filename = File.basename(url.path)
      file = URI.parse(product.image).open
      product.product_img.attach(io: file, filename: filename)
    end
  end
end
