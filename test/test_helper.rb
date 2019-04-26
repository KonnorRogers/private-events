ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # checks if a user is logged in via session id
  # @return void
  def is_logged_in?
    !session[:user_id].nil?
  end

  # simulates loggiing in so that you dont need to constantly provide params
  # this only works for non integration tests
  # @param user [User] The user to login as
  # @return void
  def login_as(user)
    session[:user_id] = user.id
  end
end

class ActionDispatch::IntegrationTest

  # cannot modify a session in an integration test so you must make a request
  # logs in as the user given
  # @param user [User] The user to login as
  # @return void
  def login_request(user)
    post login_path, params: { name: user.name }
  end
end
