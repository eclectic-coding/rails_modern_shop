require "open-uri"

class Product < ApplicationRecord
  belongs_to :category

  has_one_attached :product_img

  validates :title, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :stock, presence: true, uniqueness: true
  validates :quantity, presence: true
  validates :category, presence: true

  before_validation :set_status

  before_create :create_stock_number
  after_create :grab_image

  # method runs only on original api import and saves image to ActiveStorage
  def grab_image
    unless image.nil?
      url = URI.parse(image)
      Rails.logger.debug { " Set image URL #{url}" }
      filename = File.basename(url.path)
      Rails.logger.debug { " Set image filename #{filename}" }
      file = URI.parse(image).open
      Rails.logger.debug { " Set image stream #{file}" }
      product_img.attach(io: file, filename: filename)
    end
  end

  def create_stock_number
    if stock.nil?
      self.stock = loop do
        number = SecureRandom.hex(12)
        break number unless Product.exists?(stock: number)
      end
    end
  end

  def set_status
    if quantity.zero?
      self.status = "inactive"
    elsif quantity.positive?
      self.status = "active"
    end
  end
end
