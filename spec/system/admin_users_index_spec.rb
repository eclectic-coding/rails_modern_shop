require "rails_helper"

RSpec.describe "AdminUsersIndex", type: :system do
  before do
    driven_by(:rack_test)
  end

  scenario "index including pagination" do
    login_as create(:user, :admin)
    create_list(:user, 30)
    visit admin_users_path
    expect(page).to have_selector "ul.pagination"

    click_link "2"
    expect(page).to have_current_path(admin_users_path(page: 2))
  end
end
