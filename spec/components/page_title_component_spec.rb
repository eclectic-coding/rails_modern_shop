# frozen_string_literal: true

require "rails_helper"

RSpec.describe PageTitleComponent, type: :component do
  before do
    login_as(create(:user, :admin))
  end

  it "renders the title" do
    render_inline(described_class.new(title: "My Title"))
    expect(rendered_content).to include("My Title")
  end

  it "renders additional content" do
    expected = "My Additional Content"
    render_inline(described_class.new(title: "My Title")) do
      expected
    end
    expect(rendered_content).to include(expected)
  end
end
