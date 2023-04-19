class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:show, :edit, :update, :archive]

  layout "admin"

  def index
    @pagy, @products = pagy(Product.all.order(:title), items: 10)
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to admin_product_path(@product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
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

  def archive
    @product.toggle!(:product_available)
    redirect_to admin_products_path, notice: "Product was successfully archived."
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
    params.require(:product).permit(:price, :status, :product_available, :quantity, :description, :stock, :category_id, :product_img)
  end
end
