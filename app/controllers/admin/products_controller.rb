class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:show, :edit, :update, :archive]
  include Filterable

  layout "admin"

  def index
    @pagy, @products = pagy(Product.all.order(:title), items: 10)
    @categories = @products.map(&:category).uniq
  end

  def list
    @pagy, @products = pagy(filter!(Product), items: 10)

    render(partial: "admin/products/products", locals: { products: @products, pagy: @pagy })
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
    @product.toggle(:product_available)
    redirect_to admin_products_path, notice: "Product was successfully archived."
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(
      :title,
      :description,
      :price,
      :category_id,
      :quantity,
      :stock,
      :product_available,
      :product_img
    )
  end
end
