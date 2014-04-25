require 'sinatra'
require 'rspec'
require 'capybara' 
require 'rack/test'
include Rack::Test::Methods
include Capybara::DSL 
Capybara.default_driver = :selenium
Capybara.javascript_driver = :webkit

def app
  Capybara.app = Sinatra::Application
end

set :environment, :test 

# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  config.order = 'random'
end
