class Event < ActiveRecord::Base
  has_many :occupants, :dependent => :destroy
  has_many :drivers, :dependent => :destroy
  #has_many :users, :through => :occupants

  attr_accessible :description, :event_date, :event_time, :location, :status, :title, :to_from

  TO_FROM_TYPES = ["To", "From"]
  LOCATION_TYPES = ["","LEH", "Boat House"]
  validates :title, :to_from, :event_date, :location, :presence => true
  validates_inclusion_of :to_from, :in => TO_FROM_TYPES

  def Event.purge
    # cleans out the old events. not sure if there's a better way to count
    # the number purged, but we'll do it this way
    n = count
    destroy_all(["event_date < ?", 5.days.ago])
    n - count
  end

end
