require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @admin = Admin.new(first_name: "abc", last_name: "xyz", email: "abcxyz@gmail.com", password: "12345678", password_confirmation: "12345678")
  end


  # GROUP 1 - New object is valid

  test "object should be valid" do
    assert @admin.valid?
  end

  # GROUP 2 - Presence of all the fields

  test "first name should be present" do
    @admin.first_name = nil
    assert_not @admin.valid?
  end

  test "last name should be present" do
    @admin.last_name = nil
    assert_not @admin.valid?
  end

  test "email address should be present" do
    @admin.email = nil
    assert_not @admin.valid?
  end

  test "password field should be present" do
    @admin.password = nil
    assert_not @admin.valid?
  end

  test "confirm password field should be present" do
    @admin.password_confirmation = ''
    assert_not @admin.valid?
  end


  # GROUP 3 : Fields are alpha-numeric

  test "first name, last name, password and email can be alphanumeric" do
    @admin.first_name = 'abc123'
    @admin.last_name = 'xyz123'
    @admin.password = 'abc123xyz'
    @admin.password_confirmation = 'abc123xyz'
    @admin.email = 'xyz456@ncsu.edu'
    assert @admin.valid?
  end

  # GROUP 4 : Length of fields exceeds the max specified limit

  test "first_name should not be greater than 50 characters" do
    @admin.first_name = 'a' * 51
    assert_not @admin.valid?
  end

  test "last_name should not be greater than 50 characters" do
    @admin.last_name = 'a' * 51
    assert_not @admin.valid?
  end

  test "password should not be greater than 25 characters" do
    @admin.last_name = 'a' * 26
    assert_not @admin.valid?
  end

  test "email should not be greater than 200 characters" do
    @admin.email = 'a' * 189 + '@example.com'
    assert_not @admin.valid?
  end


  # GROUP 5 : Length of the fields should not be less than the min specified limit

  test "password should not be less than 8 characters" do
    @admin.password = 'xyz123'
    assert_not @admin.valid?
  end

  # GROUP 6 : Email should be in proper format

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @admin.email = valid_address
      assert @admin.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @admin.email = invalid_address
      assert_not @admin.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  # GROUP 7 : Whitespaces within the fields

  test "first_name can contain whitespaces" do
    @admin.first_name = "abc xyz"
    assert @admin.valid?
  end

  test "last_name can contain whitespaces" do
    @admin.last_name = "xyz lmn"
    assert @admin.valid?
  end

  test "password can contain whitespaces" do
    @admin.password = "xyz 123 abc"
    Rails.logger.info "*************#{@admin.password}"
    assert @admin.valid?
  end

  test "email cannot have whitespace" do
    @admin.email = 'abc xyz@gmail.com'
    assert_not @admin.valid?
  end

  # GROUP 8 : Email address unique

  test "email addresses should be unique" do
    duplicate_admin = @admin.dup
    @admin.save
    assert_not duplicate_admin.valid?
  end

  test "email addresses should be unique even if case is changed" do
    duplicate_admin = @admin.dup
    duplicate_admin.email = @admin.email.upcase
    @admin.save
    assert_not duplicate_admin.valid?
  end

end

