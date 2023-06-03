require "rails_helper"

RSpec.describe "AdminUsersIndexFiltering", type: :system do
  before do
    driven_by(:selenium_chrome_headless)
  end

  describe "filtering", type: :system, js: true do
    before do
      login_as create(:user, :admin)
      create(:user)
    end

    it "filters by role" do
      visit admin_users_path
      expect(page).to have_selector("tbody tr", count: 2)
      select "Admin", from: "role"
      expect(page).to have_selector("tbody tr", count: 1)
    end

    it "filters by search" do
      visit admin_users_path
      fill_in "search", with: "Example User"
      expect(page).to have_selector("tbody tr", count: 1)
    end
  end
end
