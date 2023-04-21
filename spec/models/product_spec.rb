require "rails_helper"

RSpec.describe Product, type: :model do
  describe "Create Product stock" do
    it "creates a stock number and active status" do
      product = create(:product)
      expect(product.stock).not_to be_nil
    end

  end
end
