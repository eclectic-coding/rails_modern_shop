# frozen_string_literal: true

require "rails_helper"

RSpec.describe Admin::ProductStatusComponent, type: :component do
  before do
    login_as(create(:user, :admin))
  end

  it "renders for admin archived product" do
    product = create(:product, product_available: false, quantity: 1)
    render_inline(described_class.new(product: product))

    expect(rendered_content).to include("Archived")
  end

  it "renders for admin active product" do
    product = create(:product, product_available: true, quantity: 1)
    render_inline(described_class.new(product: product))

    expect(rendered_content).to include("Active")
  end

  it "renders for admin active product based on quantity" do
    product = create(:product, quantity: 1)
    render_inline(described_class.new(product: product))

    expect(rendered_content).to include("Active")
  end

  it "renders for admin product out-of-stock based on zero quantity" do
    product = create(:product, quantity: 0)
    render_inline(described_class.new(product: product))

    expect(rendered_content).to include("Out of Stock")
  end
end
