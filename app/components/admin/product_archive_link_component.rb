# frozen_string_literal: true

class Admin::ProductArchiveLinkComponent < ViewComponent::Base
  include Rails.application.routes.url_helpers

  attr_reader :product, :pagy

  def initialize(product:)
    @product = product
  end

  private

  def product_available?
    @product.product_available?
  end
end
