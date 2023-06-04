require "rails_helper"

RSpec.describe "AdminSortProducts", type: :system do
  before do
    driven_by(:selenium_chrome_headless)
  end

  before do
    login_as create(:user, :admin)
    visit admin_products_path
    create(:product, title: "Product_1", category_id: create(:category, name: "My String 1").id, quantity: 1, price: 100, product_available: true)
    create(:product, title: "Product_2", category_id: create(:category, name: "My String 2").id, quantity: 2, price: 200, product_available: false)
    create(:product, title: "Product_3", category_id: create(:category, name: "My String 3").id, quantity: 3, price: 300, product_available: true)
  end

  describe "sorting by title", type: :system, js: true do
    it "sorts ascending by title" do
      find("a", text: "Title").click

      within "tbody tr:nth-child(1)" do
        expect(page).to have_text "Product_1"
      end
    end

    it "sorts descending by title" do
      click_link "Title"
      find("a", text: "Title").click

      within "tbody tr:nth-child(1)" do
        expect(page).to have_text "Product_3"
      end
    end
  end

  describe "sorting by category", type: :system, js: true do
    it "sorts ascending by category" do
      find("a", text: "Category").click

      within "tbody tr:nth-child(1)" do
        expect(page).to have_text "My String 1"
      end
    end
  end

  describe "sorting by quantity", type: :system, js: true do
    it "sorts ascending by quantity" do
      find("a", text: "Quantity").click

      within "tbody tr:nth-child(1)" do
        expect(page).to have_text "1"
      end
    end
  end

  describe "sorting by price", type: :system, js: true do
    it "sorts ascending by price" do
      find("a", text: "Price").click

      within "tbody tr:nth-child(1)" do
        expect(page).to have_text "100"
      end
    end
  end

  describe "sorting by status", type: :system, js: true do
    it "sorts ascending by status" do
      find("a", text: "Status").click

      within "tbody tr:nth-child(1)" do
        expect(page).to have_text "Archived"
      end
    end
  end
end
