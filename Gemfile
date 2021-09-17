# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 7.0.0.alpha2'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '>= 5'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '>= 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '>= 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '>= 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '>= 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '>= 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

### Gems added by developer
# Authentication
gem 'auth0'
gem 'omniauth-auth0'
gem 'omniauth-rails_csrf_protection'
# Authorization
gem 'pundit'

# Log/Tracing/Error
# gem 'lograge'
# gem 'ddtrace', require: 'ddtrace/auto_instrument'

group :development, :test do
  gem 'rspec-rails', '>= 4'
  # check the consistency of the database constraints with the application validations
  gem 'database_consistency', require: false
  # Ensure good code style
  gem 'rubocop'
  gem 'rubocop-shopify', require: false
  # Security audits
  gem 'brakeman'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5'
  gem 'web-console', '>= 3.3.0'
  gem 'debug'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'pundit-matchers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mri]
