require "rails_helper"

RSpec.describe "Admin::Dashboards", type: :request do
  describe "GET /show" do
    before do
      sign_in create(:user, :admin)
    end

    it "returns http success" do
      get admin_root_path
      expect(response).to have_http_status(:success)
    end
  end
end
