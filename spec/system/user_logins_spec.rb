require "rails_helper"

RSpec.describe "UserLogins", type: :system do
  before do
    driven_by(:selenium_chrome_headless)
    visit users_account_show_path
  end

  describe "login existing customer user" do
    let(:user) { create(:user) }

    it "login with valid email and password" do
      fill_in "login_email", with: user.email
      fill_in "login_password", with: user.password
      click_button "Log in"

      expect(page).to have_content("MY ACCOUNT")
    end

    it "login with invalid email and password" do
      fill_in "login_email", with: "invalid@example.com"
      fill_in "login_password", with: "invalid"
      click_button "Log in"

      expect(page).to have_content("Invalid Email or password.")
    end
  end

  describe "login existing admin user" do
    let(:admin) { create(:user, :admin) }

    it "login with valid email and password" do
      fill_in "login_email", with: admin.email
      fill_in "login_password", with: admin.password
      click_button "Log in"

      expect(page).to have_content("Signed in successfully")
      expect(page).to have_content("Admin Dashboard")
    end
  end
end
