require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @input_attributes = {:name => "sam",
      :email => "here@there.com",
      :password => "hohoho",
      :password_confirmation => "hohoho",
      :role => "Student",
      :first_name => "Sam",
      :surname => "Smith"}
    end

  test "user attributes must not be empty" do
    user = User.new
    assert user.invalid?
    assert user.errors[:name].any?
    assert user.errors[:email].any?
    assert user.errors[:role].any?
    assert user.errors[:first_name].any?
    assert user.errors[:surname].any?
  end

  test "user has valid attributes" do
    user = User.new(@input_attributes)
    assert user.valid?
  end

  test "password must match confirmation" do
    user = User.new(:name => "sam",
      :email => "here@there.com",
      :password => "hohoho",
      :password_confirmation => "hahaha",
      :role => "Student",
      :first_name => "Sam",
      :surname => "Smith")
    assert user.invalid?
    assert_equal "doesn't match confirmation", user.errors[:password].join('; ')

    user.password_confirmation = "hohoho"
    assert user.valid?

  end
  test "role must be valid" do
    user = User.new(@input_attributes)
    user.role = "hedgehog"
    assert user.invalid?
    assert_equal "is not included in the list", user.errors[:role].join('; ')

    user.role = "Parent"
    assert user.valid?
    user.role = "Student"
    assert user.valid?
  end

  test "user name must be unique" do
    user = User.new(@input_attributes)
    user.name = users(:bill).name
    assert user.invalid?
    assert_equal "has already been taken", user.errors[:name].join('; ')
    user.name = "jimmy"
    assert user.valid?
  end

  test "email must be unique" do
    user = User.new(@input_attributes)
    user.email = users(:bill).email
    assert user.invalid?
    assert_equal "has already been taken", user.errors[:email].join('; ')
    user.email = "nowhere@bbc.co.uk"
    assert user.valid?
  end

  test "can send password reset" do
    user = User.new(@input_attributes)
    mail = user.send_password_reset
    assert_match /To reset your password/, mail.body.encoded
  end

# test "the truth" do
  #   assert true
  # end
end
