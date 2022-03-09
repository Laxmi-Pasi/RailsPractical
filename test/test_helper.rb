ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  include Devise::Test::IntegrationHelpers
  include Warden::Test::Helpers

  def log_in( myuser )
    if integration_test?
      #user warden helper
      login_as(myuser, :scope => :myuser)
    else
      #use devise helper
      sign_in( myuser )
    end
  end
  
end
