class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:show, :edit, :update, :destroy]

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
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to admin_product_path(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
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

  def product_params
    params.require(:product).permit(:price, :quantity, :description, :stock, :category_id)
  end
end
