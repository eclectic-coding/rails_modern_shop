require "rails_helper"

RSpec.describe "Admin::Products", type: :request do
  before do
    sign_in create(:user, :admin)
  end

  let(:valid_attributes) { create(:product) }

  describe "GET /index" do
    it "returns http success" do
      get admin_products_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      product = create(:product)
      get admin_product_path(product)
      expect(response).to be_successful
    end
  end

  describe "GET /admin/products/new" do
    it "returns http success" do
      get new_admin_product_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "CREATE /admin/products" do
    xit "creates a new product" do
      expect do
        post admin_products_path, params: { product: create(:product) }
      end.to change(Product, :count).by(1)
    end
  end

  describe "GET /admin/products/edit" do
    it "returns http success" do
      product = create(:product)
      get edit_admin_product_path(product)
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH /admin/products" do
    it "updates the requested product" do
      product = create(:product)
      patch admin_product_path(product), params: { product: { price: 100 } }
      expect(product.reload.price).to eq(100)
    end
  end
end
