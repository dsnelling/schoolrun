class EventComment < ActiveRecord::Base
  attr_accessible :comment, :comment_by, :event_id
  belongs_to :event
  validates :comment, :presence => true
end
