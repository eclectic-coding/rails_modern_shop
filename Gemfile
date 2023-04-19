# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

eval_gemfile "config/gems/app.rb"

gem "rails", "~> 7.0.4.3"
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
  gem "capybara"
  gem "webdrivers"
end

group :development do
  gem "web-console"
  eval_gemfile "gemfiles/rubocop.gemfile"
end

# gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
