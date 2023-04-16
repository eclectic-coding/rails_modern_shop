require "open-uri"

class Product < ApplicationRecord
  belongs_to :category

  has_one_attached :product_img
  before_save :grab_image

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

end
