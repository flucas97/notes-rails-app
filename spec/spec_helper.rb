require 'webmock/rspec'
require 'vcr'
require 'capybara/rspec'

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new app, browser: :chrome,options:Selenium::WebDriver::Chrome::Options.new(args:%w[headless disable-gpu])
end

RSpec.configure do |config|

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  # Factory Bot Lint
  config.before(:suite) do 
    FactoryBot.lint
    config.include Capybara::DSL
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

 
  config.shared_context_metadata_behavior = :apply_to_host_groups
end
