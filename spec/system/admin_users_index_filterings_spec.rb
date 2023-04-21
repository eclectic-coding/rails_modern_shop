require 'rails_helper'

RSpec.describe "AdminUsersIndexFilterings", type: :system do
  before do
    login_as create(:user, :admin)
  end

  describe "filtering", type: :feature do
    it "filters by role" do
      create(:user)
      visit admin_users_path
      expect(page).to have_selector("tbody tr", count: 2)
      select "Admin", from: "role"
      expect(page).to have_selector("tbody tr", count: 1)
    end
  end
end
