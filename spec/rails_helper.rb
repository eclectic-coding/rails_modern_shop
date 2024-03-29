require "simplecov"
SimpleCov.start "rails" do
  add_filter "app/channels/"
  add_filter "app/jobs/"
  add_filter "app/mailers/"
  add_filter "app/policies/"
end

require "spec_helper"
ENV["RAILS_ENV"] ||= "test"

require File.expand_path("../config/environment", __dir__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require "rspec/rails"
require "capybara/rails"
require "fuubar"
require "webmock/rspec"

Dir[Rails.root.join("spec", "support", "**", "*.rb")].sort.each { |f| require f }

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

RSpec.configure do |config|
  config.before(:all, type: :request) do
    WebMock.allow_net_connect!
  end

  config.before(:all, type: :system) do
    WebMock.allow_net_connect!
  end

  config.include FactoryBot::Syntax::Methods
  config.include Warden::Test::Helpers
  config.include Devise::Test::IntegrationHelpers, type: :request # to sign_in user by Devise
  config.include ViewComponent::TestHelpers, type: :component
  config.include Capybara::RSpecMatchers, type: :component
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.fuubar_progress_bar_options = {format: "Completed Tests <%B> %p%% %a"}
end
