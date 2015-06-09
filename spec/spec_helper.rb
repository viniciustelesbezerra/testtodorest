require 'simplecov'
SimpleCov.start do
  add_filter "/spec/"
  add_group "Models", "app/models"
  add_group "Controllers", "app/controllers"
  add_group "Mailers", "app/mailers"
  add_group "Helpers", "app/helpers"
  add_group "Initializers", "config/initializers"
end

ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/rspec'
require 'factory_girl_rails'
require 'database_cleaner'

Capybara.run_server = true
# Capybara.app_host = 'http://localhost:3000'
Capybara.server_port = 8200
Capybara.default_wait_time = 5
Capybara.default_driver = :selenium

DatabaseCleaner.strategy = :truncation

Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  config.include Devise::TestHelpers, type: :controller
  config.extend ControllerMacros, type: :controller
  config.include RequestMacros, type: :request

  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"

  config.include Capybara::DSL, type: :request
  config.include FactoryGirl::Syntax::Methods
  
  DatabaseCleaner.orm = "mongoid" 
  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
