class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!

  layout "admin"

  def index
    @products = Product.all
  end

  def show
  end

  def new
  end

  def edit
  end
end
