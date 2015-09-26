require 'test_helper'


class AdminsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  # Setup creates test objects
  def setup
    @admin = Admin.new(first_name: "abc", last_name: "cba", email: "abc@example.com", password: "abc123abc", password_confirmation: "abc123abc")
    @other_admin = Admin.new(first_name: "xyz", last_name: "zyx", email: "xyz@example.com", password: "xyz123xyz", password_confirmation: "xyz123xyz")
  end

  # Test 1 :
  test "should get index" do
    get :index
    assert_response :success
  end

  # Test 2 :
  test "should get new" do
    get :new
    assert_response :success
  end

  # Test 3 :
  test "should redirect to home if admin is successfully created" do
    post :create, admin: { first_name: @admin.first_name, last_name: @admin.last_name, email: @admin.email, password: @admin.password, password_confirmation: @admin.password_confirmation }
    assert_not flash.empty?
    assert_redirected_to root_path
  end

  # Test 4 :
  test "should render 'new' if admin is not successfully created" do
    post :create, admin: { first_name: @admin.first_name, last_name: @admin.last_name, email: @admin.email, password: @admin.password, password_confirmation: "abcabcabc" }
    assert flash.empty?
    assert_template :new
  end

  # Test 5 :
  test "should show admin" do
    @admin.save
    log_in_admin(@admin)
    get :show, id: @admin
    assert_response :success
  end

  # Test 6 :
  test "should redirect edit when not logged in" do
    @admin.save
    get :edit, id: @admin
    assert_not flash.empty?
    assert_redirected_to login_admin_path
  end

  # Test 7 :
  test "should redirect update when not logged in" do
    @admin.save
    patch :update, id: @admin, admin: { first_name: @admin.first_name, last_name: @admin.last_name, email: @admin.email, password: @admin.password, password_confirmation: @admin.password_confirmation }
    assert_not flash.empty?
    assert_redirected_to login_admin_path
  end

  # Test 8 :
  test "should allow admin to update constraints are adhered" do
    @admin.save
    log_in_admin(@admin)
    get :edit, id: @admin
    patch :update, id: @admin, admin: { first_name: "updated first name", last_name: @admin.last_name, email: @admin.email, password: @admin.password, password_confirmation: @admin.password_confirmation }
    assert_not flash.empty?
    assert_redirected_to @admin
  end

  # Test 9 :
  test "should not allow admin to update when constraints are violated" do
    @admin.save
    log_in_admin(@admin)
    get :edit, id: @admin
    patch :update, id: @admin, admin: { first_name: "", last_name: @admin.last_name, email: @admin.email, password: @admin.password, password_confirmation: @admin.password_confirmation }
    assert_template :edit
  end

  # Test 10 :
  test "should destroy another admin when an admin is logged in" do
    @admin.save
    @other_admin.save
    log_in_admin(@other_admin)
    delete :destroy, id: @admin
    assert_redirected_to admins_url
  end

end