# frozen_string_literal: true

gem "devise"
gem "name_of_person"
gem "pundit"
gem "inline_svg", "~> 1.8"
gem "faraday", "~> 2.6"
gem "pagy", "~> 6.0", ">= 6.0.3"

group :development, :test do
  gem "rspec-rails", "~> 5.0", ">= 5.0.1"
  gem "factory_bot_rails", "~> 6.2"
  gem "faker", "~> 2.18"
end

group :development do
  gem "fuubar", "~> 2.5", ">= 2.5.1"
  gem "guard", "~> 2.17"
  gem "guard-rspec", "~> 4.7", ">= 4.7.3"
end

group :test do
  gem "simplecov", "~> 0.21.2", require: false
end
