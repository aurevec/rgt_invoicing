source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "rails", "~> 7.0.3", ">= 7.0.3.1"

gem 'rack-cors'

gem "pg"
gem "redis", "~> 4.0"

gem "sprockets-rails"

gem 'slim', '~> 4.1'
gem 'rabl', '~> 0.16.0'
gem 'mjml-rails'

gem 'sidekiq', '~> 6.5', '>= 6.5.6'

gem "puma", "~> 5.0"

gem "jbuilder"

gem "bootsnap", require: false

gem 'active_storage_validations', '~> 0.9.8'
gem 'enumerize', '~> 2.5'

gem 'interactor-rails', '~> 2.2', '>= 2.2.1'

gem "aws-sdk-s3", require: false

gem 'appsignal'

group :development do
  gem "web-console"
  gem "letter_opener"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
