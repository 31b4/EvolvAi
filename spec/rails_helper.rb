# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'

# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'rspec/rails'

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories.
Dir[Rails.root.join('spec/support/**/*.rb')].sort.each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end

RSpec.configure do |config|
  # Configure factory bot syntax for cleaner calls
  config.include FactoryBot::Syntax::Methods

  # Devise helpers for controller and request specs
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Devise::Test::IntegrationHelpers, type: :request

  # Use transactional fixtures (replaces DatabaseCleaner for most cases)
  config.use_transactional_fixtures = true

  # Uncomment below to configure DatabaseCleaner for JavaScript or non-standard cases
  # config.before(:suite) do
  #   DatabaseCleaner.clean_with(:truncation)  # Wipe the test database at the start
  # end
  #
  # config.before(:each) do
  #   DatabaseCleaner.strategy = :transaction  # Default strategy for regular tests
  # end
  #
  # config.before(:each, type: :request) do
  #   DatabaseCleaner.strategy = :truncation  # Use truncation for request specs
  # end
  #
  # config.after(:each) do
  #   DatabaseCleaner.clean  # Clean up after each test run
  # end


  # Automatically infer spec types based on file location
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces
  config.filter_rails_from_backtrace!

  # Focus mode for debugging
  config.filter_run_when_matching :focus

  # Randomize the order of tests
  config.order = :random
  Kernel.srand config.seed

  # Persist example states between runs for focused re-runs
  # config.example_status_persistence_file_path = "spec/examples.txt"

  # Enable chaining of custom matcher descriptions
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # Verify mocks and prevent stubbing undefined methods
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  # Automatically require support files in `spec/support` without duplication
  Dir[Rails.root.join('spec/support/**/*.rb')].sort.each do |file|
    require file unless file.end_with?('_spec.rb')
  end
end