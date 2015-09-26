ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  # Returns true if a test admin is logged in.
  def is_logged_in?
    !session[:admin_id].nil?
  end

  # Logs in a test admin.
  def log_in_admin(admin, options = {})
    password    = options[:password]    || 'password'
    remember_me = options[:remember_me] || '1'
    session[:admin_id] = admin.id
  end

end
