# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "rails", "~> 7.0.4"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "jsbundling-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "cssbundling-rails"
gem "image_processing"
gem "jbuilder"
gem "redis", "~> 4.0"
gem "bootsnap", require: false

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "standard", "~> 1.1", ">= 1.1.5", require: false
  gem "capybara"
  gem "webdrivers"
end

group :development do
  gem "web-console"
end

# gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

eval_gemfile "config/gems/app.rb"
