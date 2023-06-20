# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "rails", "~> 7.0.5"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 6.3.0"
gem "jsbundling-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "cssbundling-rails"
gem "image_processing"
gem "jbuilder"
gem "redis", "~> 5.0"
gem "bootsnap", require: false

# ===== App gems =====
gem "devise"
gem "name_of_person"
gem "pundit"
gem "inline_svg", "~> 1.8"
gem "faraday", "~> 2.6"
gem "pagy", "~> 6.0.4"
gem "view_component", "~> 3.2.0"

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "capybara"
  gem "webdrivers"
  gem "rspec-rails", "~> 6.0.0"
  gem "factory_bot_rails", "~> 6.2"
  gem "faker", "~> 3.2.0"
  gem "standard"
end

group :development do
  gem "web-console"
  gem "fuubar", "~> 2.5", ">= 2.5.1"
  gem "guard", "~> 2.17"
  gem "guard-rspec", "~> 4.7", ">= 4.7.3"
  gem "bundle-audit"
end

group :test do
  gem "simplecov", "~> 0.22.0", require: false
  gem "webmock"
end

# gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
