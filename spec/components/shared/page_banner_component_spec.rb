# frozen_string_literal: true

require "rails_helper"

RSpec.describe PageBannerComponent, type: :component do
  it "renders page banner" do
    render_inline(described_class.new(title: "Page Title"))

    expect(rendered_content).to include("Page Title")
  end
end
