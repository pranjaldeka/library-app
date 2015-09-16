require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new_user" do
    get :new_user
    assert_response :success
  end

  test "should get new_admin" do
    get :new_admin
    assert_response :success
  end

end
