require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @input_attributes = {
      name: "sam",
      password: "hohoho",
      password_confirmation: "hohoho",
      email: "sam@herethere.com",
      role: "Student"
    }
    @user = users(:one)
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

  test "should be admin" doheroku logs
    admin =  User.create(@ad)
    session[:user_id] = admin.id
    a = User.find(session[:user_id])
    assert_equal "Admin", a.role
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    admin =  User.create(@ad)
    session[:user_id] = admin.id
    get :new
    assert_response :success
  end

  #...
  test "should create user" do
    admin =  User.create(@ad)
    session[:user_id] = admin.id
    assert_difference('User.count') do
      post :create, :user => { :name => "sam",
        :password => "hohoho",
        :password_confirmation => "hohoho",
        :email => "sam@herethere.com",
        :role => "Student",
        :first_name => "Sam",
        :surname => "Massingberd-Massingberd"
        }
    end
    assert_equal 'User sam was successfully created.', flash[:notice]
    assert_redirected_to users_path
  end

  test "should show user" do
    admin =  User.create(@ad)
    session[:user_id] = admin.id
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    admin =  User.create(@ad)
    session[:user_id] = admin.id
    get :edit, id: @user
    assert_response :success
  end

  #....
  test "should update user" do
    admin =  User.create(@ad)
    session[:user_id] = admin.id
    put :update, :id => @user.to_param, :user => @input_attributes
    assert_equal 'User sam was successfully updated.', flash[:notice]
    assert_redirected_to user_path(@user)
  end

  test "should destroy user" do
    admin =  User.create(@ad)
    session[:user_id] = admin.id
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
