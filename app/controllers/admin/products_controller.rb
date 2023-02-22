class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:show, :new, :edit, :destroy]

  layout "admin"

  def index
    @products = Product.all
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
    @product.destroy
    redirect_to admin_products_path, status: :see_other
  end

  def list
    @products = if params[:column] == "category"
      Product.joins(:category).merge(Category.order(name: params[:direction]))
    else
      Product.order("#{params[:column]} #{params[:direction]}")
    end
    render(partial: "admin/products/products", locals: { products: @products })
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end
end
