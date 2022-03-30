source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'rails', '~> 5.2.3' # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'mysql2', '>= 0.4.4', '< 0.6.0' # Use mysql as the database for Active Record
gem 'puma', '~> 4.3' # Use Puma as the app server
gem 'uglifier', '>= 1.3.0' # Use Uglifier as compressor for JavaScript assets
gem 'coffee-rails', '~> 4.2' # Use CoffeeScript for .coffee assets and views
gem 'turbolinks', '~> 5' # Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'jbuilder', '~> 2.5' # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'carrierwave' # Classier solution for file uploads for Rails
gem 'jquery-rails'

# Use SCSS for stylesheets
gem 'bootstrap', '~> 4.3.1'
gem 'sass-rails', '~> 5.0' # Use SCSS for stylesheets
gem 'font-awesome-sass'

# SNS login
gem 'devise_token_auth' # Simple, secure token based authentication for Rails.
gem 'devise' # Flexible authentication solution for Rails with Warden

# API
gem 'fast_jsonapi' # A lightning fast JSON:API serializer for Ruby Objects.
gem 'rack-cors', require: 'rack/cors' # provides support for Cross-Origin Resource Sharing (CORS) for Rack compatible web applications

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false
gem 'config'
gem 'dotenv-rails'

gem 'geocoder'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry'
  gem 'pry-byebug'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
