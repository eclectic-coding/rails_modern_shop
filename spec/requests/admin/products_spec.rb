require "rails_helper"

RSpec.describe "Admin::Products", type: :request do
  before do
    sign_in create(:user, :admin)
  end

  let(:valid_attributes) { create(:product) }

  describe "GET /index" do
    it "returns http success" do
      create_list(:product, 3)
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
    context "with valid parameters" do
      it "creates a new product" do
        product = attributes_for(:product)
        expect do
          post admin_products_path, params: {product: product}
        end.to change(Product, :count).by(1)
      end
    end

    context "with valid parameters" do
      it "creates a new product" do
        product = attributes_for(:product)
        product[:title] = nil
        expect do
          post admin_products_path, params: {product: product}
        end.to change(Product, :count).by(0)
      end
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
    context "with valid parameters" do
      let("product") { create(:product) }

      it "updates the requested product" do
        patch admin_product_path(product), params: {product: {price: 100}}
        expect(product.reload.price).to eq(100)
      end

      it "redirects to the product" do
        patch admin_product_path(product), params: {product: {price: 100}}
        expect(response).to redirect_to(admin_product_path(product))
      end
    end
  end

  describe "PATCH /admin/products" do
    context "with invalid parameters" do
      let("product") { create(:product) }

      it "attempts to update the requested product with invalid parameters" do
        patch admin_product_path(product), params: {product: {title: nil}}
        expect(response.status).to eq(422)
      end
    end
  end

  describe "archiving a product" do
    let(:product) { create(:product) }

    it "toggles archives the product" do
      product.toggle(:product_available)
      expect(product.product_available).to eq(false)
    end

    it "redirects to the admin products list" do
      get archive_admin_product_path(product)
      expect(response).to redirect_to(admin_products_path)
    end
  end
end
