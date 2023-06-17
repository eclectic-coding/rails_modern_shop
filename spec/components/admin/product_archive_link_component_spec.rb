# frozen_string_literal: true

require "rails_helper"

RSpec.describe Admin::ProductArchiveLinkComponent, type: :component do
  before do
    login_as(create(:user, :admin))
  end

  describe "links for archiving product" do
    let(:product) { create(:product) }

    it "renders a link with for archiving product" do
      render_inline(described_class.new(product: product))
      expect(rendered_content).to include("Archive")
    end

    it "renders a link with for un-archiving product" do
      product.update(product_available: false)
      render_inline(described_class.new(product: product))
      expect(rendered_content).to include("Unarchive")
    end
  end
end
