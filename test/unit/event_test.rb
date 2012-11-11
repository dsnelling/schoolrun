require 'test_helper'
class EventTest < ActiveSupport::TestCase

  setup do
    @input_attributes = {
      :description => "afterschool netball pickup, st Pauls",
      :event_date => "2012-10-10",
      :event_time => "18:00",
      :location => "LEH",
      :status => "OK",
      :to_from => "To",
      :title => "afterschool netball"
      }
  end

  test "Event attributes must not be empty" do
    event = Event.new
    assert event.invalid?
    assert event.errors[:title].any?
    assert event.errors[:to_from].any?
    assert event.errors[:event_date].any?
  end

  test "Event has valid attributes" do
    event = Event.new(@input_attributes)
    assert event.valid?
  end

  test "Event has valid location" do
    event = Event.new(@input_attributes)
    event.to_from = "where?"
    assert event.invalid?
    event.to_from = "To"
    assert event.valid?
    event.to_from = "From"
    assert event.valid?
  end

  test "Events can be purged" do
    # fixtures are dates all in the future
    event = Event.new(@input_attributes)
    event.event_date = 10.days.ago
    event.save
    assert_equal 1, Event.purge
  end

end
