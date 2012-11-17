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
    post :update, id: user
    assert_redirected_to login_url
    post :update, id: "blah blah"
    assert_redirected_to new_password_path
    end
   
end
