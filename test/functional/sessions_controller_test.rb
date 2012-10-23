require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should login" do
    william = users(:william)
    post :create, :name => william.name, :password => "seventeen"
    assert_redirected_to events_url
    assert_equal william.id, session[:user_id]
  end

  test "should fail login" do
    william = users(:william)
    post :create, :name => william.name, :password => "wrong"
    assert_redirected_to login_url
  end

  test "should logout" do
    delete :destroy
    assert_redirected_to events_url
  end

end
