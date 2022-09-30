require "rails_helper"

RSpec.describe "Users::Dashboards", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/users/dashboard"
      expect(response).to have_http_status(:success)
    end
  end
end
