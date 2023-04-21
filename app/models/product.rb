require "open-uri"

class Product < ApplicationRecord
  belongs_to :category

  has_one_attached :product_img

  after_create :create_stock_number

  validates :title, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :quantity, presence: true
  validates :category, presence: true

  def create_stock_number
    if stock.nil?
      self.stock = loop do
        number = SecureRandom.hex(12)
        break number unless Product.exists?(stock: number)
      end
    end
  end
end
