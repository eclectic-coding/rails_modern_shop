require "simplecov"

SimpleCov.start "rails" do
  add_filter "app/controllers/users/dashboard_controller.rb"
end
