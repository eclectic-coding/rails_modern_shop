class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update]
  include Filterable

  layout "admin"

  def index
    @pagy, @users = pagy(User.all.order(:role), items: 10)
  end

  def list
    @pagy, @users = pagy(filter!(User), items: 10)

    render(partial: "users", locals: { users: @users, pagy: @pagy })
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

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :role)
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.find(params[:id])
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def resource_class
    User
  end

  helper_method :resource_name
  helper_method :resource
  helper_method :devise_mapping
  helper_method :resource_class
end
