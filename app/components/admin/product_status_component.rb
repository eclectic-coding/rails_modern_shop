# frozen_string_literal: true

class Admin::ProductStatusComponent < ViewComponent::Base
  def initialize(product:)
    @product = product
  end

  private

  def product_available?
    @product.product_available?
  end

  def product_quantity
    @product.quantity
  end
end
