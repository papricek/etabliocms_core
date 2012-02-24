ENV["RAILS_ENV"] = "test"
require File.expand_path("../dummy/config/environment.rb", __FILE__)
require 'rspec/rails'
Bundler.require :default, :development
Rails.backtrace_cleaner.remove_silencers!

RSpec.configure do |config|
  config.mock_with :mocha
  config.use_transactional_fixtures = false
  config.before :each do
    if Capybara.current_driver == :rack_test
      DatabaseCleaner.strategy = :transaction
    else
      DatabaseCleaner.strategy = :truncation
    end
    DatabaseCleaner.start
  end
  config.after do
    DatabaseCleaner.clean
  end
end
