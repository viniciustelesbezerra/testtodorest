require 'simplecov'
SimpleCov.start do
  add_filter "/spec/"
  add_group "Models", "app/models"
  add_group "Controllers", "app/controllers"
  add_group "Mailers", "app/mailers"
  add_group "Helpers", "app/helpers"
  # add_group "Views", "app/views"
  add_group "Initializers", "config/initializers"
end

# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'
  require 'capybara/rspec'
  require 'factory_girl_rails'
  require 'database_cleaner'

Capybara.run_server = true #Whether start server when testing
# Capybara.app_host = 'http://localhost:3000'
Capybara.server_port = 8200
Capybara.default_wait_time = 5
Capybara.default_driver = :selenium

DatabaseCleaner.strategy = :truncation

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  # Devise
  config.include Devise::TestHelpers, :type => :controller
  config.extend ControllerMacros, :type => :controller
  config.include RequestMacros, :type => :request

  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  # config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  # config.use_transactional_fixtures = false 

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"

  config.include Capybara::DSL, :type => :request
  config.include FactoryGirl::Syntax::Methods
  
  DatabaseCleaner.orm = "mongoid" 
  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end


end
