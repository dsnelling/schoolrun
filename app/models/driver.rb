class Driver < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  validate :user_must_be_parent

  attr_accessible :comment, :event_id, :status, :user_id, :remarks

  STATUS_TYPES = ["","Tentative","Confirmed"]

  def remark?
    remarks.to_s.length > 0
  end

  private
  def user_must_be_parent
    if user_id
      user = User.find(user_id)
      errors.add( :user_id, "#{user.name} must be parent") unless
         user.role == "Parent"
    end
  end

end
