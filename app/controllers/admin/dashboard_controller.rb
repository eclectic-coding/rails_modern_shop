class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!
  layout "admin"

  def index
    @admin = current_user
    authorize @admin
  end

end
