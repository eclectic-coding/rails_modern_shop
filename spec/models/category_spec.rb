require "rails_helper"

RSpec.describe Category, type: :model do
  describe "creat a category" do
    it "category has a humanized name" do
      category = create(:category, name: "my category")
      expect(category.human_name).to eq("My category")
    end
  end
end
