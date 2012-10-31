require 'test_helper'

class ImportsControllerTest < ActionController::TestCase

  setup do
    @ad = {
      name: "gillian",
      password: "morecheese",
      password_confirmation: "morecheese",
      email: "gillian@herethere.com",
      role: "Admin",
      first_name: "Gillian",
      surname: "Lowe"
    }
  end


  test "should get new" do
    admin = User.create(@ad)
    session[:user_id] = admin.id
    get :new
    assert_response :success
  end

=begin  
  #this requires a bit of thought, as somehow have to simulate adding file
  test "should get create" do
    admin = User.create(@ad)
    session[:user_id] = admin.id
    get :create
    assert_response :success
  end
=end
end

