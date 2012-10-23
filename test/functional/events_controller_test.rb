require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  setup do
    @event = events(:leh)
    @update = {
      :title => "rowing dropoff",
      :event_date => "2012-10-15",
      :event_time => "13:00",
      :location => "boathouse",
      :status => "open"}
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event" do
    assert_difference('Event.count') do
      post :create, event: { description: @event.description, event_date: @event.event_date, event_time: @event.event_time, location: @event.location, status: @event.status, title: @event.title, to_from: @event.to_from }
    end

    assert_redirected_to event_path(assigns(:event))
  end

  test "should show event" do
    get :show, id: @event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event
    assert_response :success
  end

  test "should update event" do
    put :update, id: @event, :event => @update
    assert_redirected_to event_path(assigns(:event))
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete :destroy, id: @event
    end

    assert_redirected_to events_path
  end
end
