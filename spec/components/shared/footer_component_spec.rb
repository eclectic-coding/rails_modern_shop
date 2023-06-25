# frozen_string_literal: true

require "rails_helper"

RSpec.describe Shared::FooterComponent, type: :component do
  it "renders the footer" do
    render_inline(described_class.new)
    expect(rendered_content).to have_selector("footer")
  end
end
