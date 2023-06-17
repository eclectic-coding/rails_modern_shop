# frozen_string_literal: true

require "rails_helper"

RSpec.describe Admin::ProductQuantityComponent, type: :component do
  before do
    login_as(create(:user, :admin))
  end

  it "renders out of stock for product with zero quantity" do
    product = create(:product, product_available: false)
    render_inline(described_class.new(product: product))
    expect(rendered_content).to include("Archived")
  end

  it "renders quantity for product with quantity" do
    product = create(:product, quantity: 1)
    render_inline(described_class.new(product: product))
    expect(rendered_content).to include("1")
  end
end
