class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  layout "admin"

  def index
    @users = User.all
  end

  def show
  end

  def new
  end

  def create
  end

  def edit

    render turbo_stream: turbo_stream.replace(
      "user_#{@user.id}",
      partial: "admin/users/user_form",
      locals: { user: @user }
    )
  end

  def update
    if @user.update(user_params)
    end
    redirect_to admin_users_path, status: :see_other
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path, status: :see_other
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
