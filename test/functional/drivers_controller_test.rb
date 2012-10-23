require 'test_helper'

class DriversControllerTest < ActionController::TestCase
  setup do
    @driver = drivers(:one)
    @event = events(:one)
    @user = users(:one)
    @driver.event = @event
    @driver.user = @user
    @driver.save

  end

  test "should create driver" do
    assert_difference('Driver.count') do
      post :create, :event_id => events(:leh).id
    end
    assert_redirected_to events_path
  end

  test "should update driver" do
    put :update, id: @driver, driver: { comment: @driver.comment, event_id: @driver.event_id, status: @driver.status, user_id: @driver.user_id }
    assert_redirected_to driver_path(assigns(:driver))
  end

  test "should destroy driver" do
    assert_difference('Driver.count', -1) do
      delete :destroy, id: @driver
    end

    assert_redirected_to events_path
  end

=begin
    test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:drivers)
  end
=end

  test "should get new" do
    get :new, :event_id => @event.id
    assert_response :success
  end
  test "should show driver" do
    get :show, id: @driver
    assert_response :success
  end

  test "should get edit" do
     get :edit, id: @driver
    assert_response :success
  end

end
