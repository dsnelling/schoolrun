class Occupant < ActiveRecord::Base

  belongs_to :event
  belongs_to :user
  attr_accessible :event_id, :status, :user_id, :remarks

  STATUS_TYPES = ["","Tentative","Confirmed"]

  def remark?
    remarks.to_s.length > 0
  end
end
