require 'test_helper'

class PasswordResetsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should end password create email" do
    user = User.find(users(:bill))
    post :create, name: user.name
 
    assert_redirected_to login_url
    
  end

  test "should reset password" do
    token = users(:bill).password_reset_token
    user = User.find_by_password_reset_token(token)
    post :update, id: user.password_reset_token.to_s
    assert_redirected_to login_url
  end

  test "invalid password reset token" do
    post :update, id: "blah blah"
    assert_redirected_to login_url
  end

  test "password reset too old" do
    token = users(:william).password_reset_token
    user = User.find_by_password_reset_token(token)
    #puts user.name, user.password_reset_sent_at
    post :update, id: user.password_reset_token.to_s
    assert_redirected_to new_password_reset_path
  end


end
