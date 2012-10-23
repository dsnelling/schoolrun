require 'test_helper'

class OccupantsControllerTest < ActionController::TestCase
  setup do
    @occupant = occupants(:one)
    @event = events(:one)
    @user = users(:one)
    @occupant.event = @event
    @occupant.user = @user
    @occupant.save

  end

  test "should create occupant" do
    assert_difference('Occupant.count') do
      post :create, :event_id => events(:leh).id
    end
    assert_redirected_to events_path
  end

  test "should update occupant" do
    put :update, id: @occupant, occupant: { event_id: @occupant.event_id, status: @occupant.status, user_id: @occupant.user_id }
    assert_redirected_to occupant_path(assigns(:occupant))
  end

  test "should destroy occupant" do
    assert_difference('Occupant.count', -1) do
      delete :destroy, id: @occupant
    end

    assert_redirected_to events_path
  end

=begin
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:occupants)
  end
=end

  test "should get new" do
    get :new, :event_id => @event.id
    assert_response :success
  end

  test "should show occupant" do
    get :show, id: @occupant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @occupant
    assert_response :success
  end

end
