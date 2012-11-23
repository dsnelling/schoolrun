class Occupant < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  validate :user_must_be_student
  attr_accessible :event_id, :status, :user_id, :remarks

  STATUS_TYPES = ["","Tentative","Confirmed"]

  def remark?
    remarks.to_s.length > 0
  end

  private
  def user_must_be_student
    if user_id
      user = User.find(user_id)
      errors.add( :user_id, "#{user.name} must be student") unless
             user.role == "Student"
    end
  end


end
