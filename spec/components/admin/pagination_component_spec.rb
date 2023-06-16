# frozen_string_literal: true

require "rails_helper"
require "pagy"

RSpec.describe Admin::PaginationComponent, type: :component do
  include Pagy::Backend

  before do
    login_as(create(:user, :admin))
  end

  xit "renders pagination" do
    @pagy, products = pagy(create_list(:product, 11))
    render_inline(described_class.new(pagy: @pagy))

    expect(rendered_content).to include("Previous")
    expect(rendered_content).to include("Next")
  end
end
