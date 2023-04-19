require "rails_helper"

RSpec.describe "Admin::Users", type: :request do
  before do
    sign_in create(:user, :admin)
  end

  describe "GET /admin/index" do
    it "returns http success" do
      get admin_users_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /admin/users/show" do
    it "returns http success" do
      user = create(:user)
      get admin_user_path(user)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/admin/users/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /admin/users/edit" do
    it "returns http success" do
      get edit_admin_user_path(create(:user))
      expect(response).to have_http_status(:success)
    end
  end
end
