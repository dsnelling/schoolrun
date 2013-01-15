require 'test_helper'

class EventCommentTest < ActiveSupport::TestCase

  test "comment must not be blank" do
    event_comment = EventComment.new
    assert event_comment.invalid?, "comment must not be blank"
    assert event_comment.errors[:comment].any?
  end

  test "comment is valid" do
    event_comment = EventComment.new
    event_comment.comment = event_comments(:one).comment
    assert event_comment.valid?, "comment is not blank"
  end

end
