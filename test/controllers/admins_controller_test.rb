require 'test_helper'

class AdminsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    #@admin = Admin.new(first_name: "abc", last_name: "cba", email: "abc@example.com", password: "abc123", password_confirmation: "abc123")
    #@other_admin = Admin.new(first_name: "xyz", last_name: "zyx", email: "xyz@example.com", password: "xyz123", password_confirmation: "xyz123")
  end

  test "should get new" do
    get :new
    assert_response :success
  end

end

