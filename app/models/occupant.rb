class Occupant < ActiveRecord::Base

  belongs_to :event
  belongs_to :user
  attr_accessible :event_id, :status, :user_id, :remarks

  STATUS_TYPES = ["","Tentative","Confirmed"]

end
