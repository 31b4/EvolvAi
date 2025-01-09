source "https://rubygems.org"

# Rails gem for building web applications
gem "rails", "~> 8.0.1"

# Modern asset pipeline for Rails [https://github.com/rails/propshaft]
gem "propshaft"

# SQLite3 for database support in development
gem "sqlite3", ">= 2.1"

# Puma web server for running Rails applications [https://github.com/puma/puma]
gem "puma", ">= 5.0"

# JavaScript with ESM import maps for modern JS modules [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Hotwire's Turbo: SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's Stimulus: Modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Jbuilder for building JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Slim templating engine for HTML rendering
gem 'slim', '~> 5.2'

# Sass for CSS preprocessing
gem 'sass', '~> 3.7', '>= 3.7.4'

# ActiveModel secure password handling (for user authentication)
# gem "bcrypt", "~> 3.1.7"

# Sass compiler for Rails
gem 'sass-rails', '~> 6.0'

# PostgreSQL database adapter (use psql as database)
gem 'pg', '~> 1.5', '>= 1.5.6'

# Sprockets-rails to fix NoMethodError related to asset handling
gem 'sprockets-rails'

# BCrypt gem for password hashing and authentication
gem 'bcrypt', '~> 3.1.7'

# Time zone information for Windows and JRuby platforms
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Database-backed adapters for caching, background jobs, and Action Cable
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"

# Bootsnap reduces boot times by caching; required in config/boot.rb
gem "bootsnap", require: false

# Kamal for easy deployment of Rails applications as Docker containers [https://kamal-deploy.org]
gem "kamal", require: false

# Thruster for HTTP asset caching and compression in Puma [https://github.com/basecamp/thruster/]
gem "thruster", require: false

# Devise for user authentication and management
gem 'devise'

# HTTParty for making HTTP requests
gem 'httparty'

# Nokogiri for parsing HTML and XML
gem 'nokogiri'

# dotenv-rails for loading environment variables in development and test environments
gem 'dotenv-rails', groups: [:development, :test]

# ActiveStorage image processing (optional)
# gem "image_processing", "~> 1.2"

# Development and Test gems

group :development, :test do
  # Debugging with the built-in Ruby debugger [https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem]
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"

  # Brakeman for static analysis of security vulnerabilities in Rails apps [https://brakemanscanner.org/]
  gem "brakeman", require: false

  # RSpec for testing framework
  gem 'rspec-rails', '~> 7.0', '>= 7.0.1'

  # FactoryBot for generating test data
  gem 'factory_bot_rails'

  # Faker for generating random test data
  gem 'faker'

  # Database Cleaner for cleaning test databases
  gem 'database_cleaner-active_record'

  # RuboCop for Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
  gem "rubocop-rails-omakase", require: false
end

# Development gems only

group :development do
  # Web Console for debugging Rails exceptions in development [https://github.com/rails/web-console]
  gem "web-console"
end

# Test gems only

group :test do
  # Capybara for system testing with integration and acceptance tests [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"

  # Selenium WebDriver for driving browsers in tests
  gem "selenium-webdriver"

  # Rails Controller testing helpers for test-driven controller development
  gem 'rails-controller-testing'
end
