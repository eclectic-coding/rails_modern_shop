class Users::DashboardController < ApplicationController
  layout "users"

  def show
  end

  private

  def resource_name
    :user
  end

  def resource
    @resource ||= current_user
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
