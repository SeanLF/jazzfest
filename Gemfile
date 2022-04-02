# frozen_string_literal: true

source "https://rubygems.org"

ruby "3.1.1"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", "< 7"
# Use postgresql as the database for Active Record
gem "pg"
# Use Puma as the app server
gem "puma"
# Use SCSS for stylesheets
gem "sass-rails"
# Use Uglifier as compressor for JavaScript assets
gem "uglifier"
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem "jquery-rails"
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "turbolinks"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder"
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'

# authentication / authorization
gem "auth0"
gem "omniauth"
gem "omniauth-auth0"
gem "omniauth-rails_csrf_protection"
gem "pundit"

gem "bootsnap", require: false

# error tracking
gem "rollbar"

# versionining and history
gem "paper_trail"

# reports
gem "caxlsx"
gem "caxlsx_rails"
gem "rubyzip"

# for editing volunteer opportunities
gem "font-awesome-sass"
gem "wysiwyg-rails"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "debug"
  gem "dotenv-rails"
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem "listen"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "awesome_print"
  gem "rubocop-shopify"
  gem "spring"
  gem "spring-watcher-listen"
  gem "web-console"
end
