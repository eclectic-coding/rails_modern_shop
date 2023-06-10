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

  FILTER_PARAMS = %i[search category category_id column direction].freeze

  scope :by_category, ->(category_id) { where(category_id: category_id) if category_id.present? }
  scope :search_title, ->(query) { where("products.title ilike ?", "%#{query}%") }

  def self.filter(filters)
    Product.includes(:category)
      .by_category(filters["category_id"])
      .search_title(filters["search"])
      .order("#{filters["column"]} #{filters["direction"]}")
  end

  def create_stock_number
    if stock.nil?
      self.stock = loop do
        number = SecureRandom.hex(12)
        break number unless Product.exists?(stock: number)
      end
    end
  end
end
