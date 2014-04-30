ENV['RACK_ENV'] = 'test'
require 'rspec'
require 'capybara'
require 'capybara/rspec'
require 'rack/test'
require 'factory_girl'
require 'database_cleaner'
require_relative '../app'

set :views => File.join(File.dirname(__FILE__), "..", "views")

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include FactoryGirl
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'

  # this should give us Rack test methods
  #config.include Rack::Test::Methods
  config.include Capybara::DSL 
  
  config.before(:suite) do
     DatabaseCleaner.strategy = :transaction
     DatabaseCleaner.clean_with(:truncation)
   end

   config.before(:each) do
     DatabaseCleaner.start
   end

   config.after(:each) do
     DatabaseCleaner.clean
   end
end

FactoryGirl.definition_file_paths = %w{./spec/factories}
FactoryGirl.find_definitions
DatabaseCleaner.strategy = :truncation
ActiveRecord::Base.logger.level = 2
Capybara.app = Sinatra::Application.new

Capybara.register_driver :rack_test do |app|
  Capybara::RackTest::Driver.new(app, :headers =>  { 'User-Agent' => 'Capybara' })
end

def app
	Sinatra::Application.new
end
