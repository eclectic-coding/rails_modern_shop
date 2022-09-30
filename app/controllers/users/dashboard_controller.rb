class Users::DashboardController < ApplicationController
  before_action :authenticate_dashboard!

  layout "users"

  def show
  end

  protected

  def authenticate_dashboard!
    if !current_user
      redirect_to users_account_show_path
    end
  end

end
