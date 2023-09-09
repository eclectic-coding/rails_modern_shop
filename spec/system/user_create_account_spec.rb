require "rails_helper"

RSpec.describe "UserCreateAccount", type: :system do
  before do
    driven_by(:selenium_chrome_headless)
    visit users_account_show_path
  end

  describe "create customer user" do
    it "login with valid email and password" do
      fill_in "user_name", with: "John Doe"
      fill_in "user_email", with: "john@example.com"
      fill_in "user_password", with: "password"
      fill_in "user_password_confirmation", with: "password"
      click_button "Create account"

      expect(page).to have_content("MY ACCOUNT")
    end
  end
end
