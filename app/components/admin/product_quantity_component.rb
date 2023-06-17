# frozen_string_literal: true

class Admin::ProductQuantityComponent < ViewComponent::Base

  def initialize(product:)
    @product = product
  end

  private

  attr_reader :product

  def product_available?
    product.product_available?
  end
end
