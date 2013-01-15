require 'test_helper'

class EventCommentsControllerTest < ActionController::TestCase
  setup do
    @event_comment = event_comments(:one)
    @user = users(:bill)
    @event_comment.comment_by = @user.id
    @event = events(:one)
    @event.event_comments << @event_comment
  end

  test "should get index" do
    get :index, :event_id => @event.id
    assert_response :success
    assert_not_nil assigns(:event_comments)
  end

  test "should create event_comment" do
    assert_difference('EventComment.count') do
      post :create, event_id: @event.id, event_comment: { comment: @event_comment.comment, comment_by: @event_comment.comment_by, event_id: @event_comment.event_id }
    end

    assert_redirected_to event_path(assigns(:event))
  end

=begin
  test "should show event_comment" do
    get :show, id: @event_comment
    assert_response :success
  end
=end

  test "should get edit" do
    get :edit, event_id: @event.id, id: @event_comment.id
    assert_response :success
  end

  test "should update event_comment" do
    put :update, id: @event_comment, event_comment: { comment: @event_comment.comment, comment_by: @event_comment.comment_by, event_id: @event_comment.event_id }
    assert_redirected_to event_path(assigns(:event_comment).event)
  end

  test "should destroy event_comment" do
    assert_difference('EventComment.count', -1) do
      delete :destroy, id: @event_comment
    end

    assert_redirected_to event_path(assigns(:event_comment).event)
  end
end
