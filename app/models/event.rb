class Event < ActiveRecord::Base
  has_many :occupants
  has_many :drivers
  #has_many :users, :through => :occupants

  attr_accessible :description, :event_date, :event_time, :location, :status, :title, :to_from

  TO_FROM_TYPES = ["To", "From"]
  LOCATION_TYPES = ["","LEH", "Boat House"]
  validates :title, :to_from, :event_date, :location, :presence => true
  validates_inclusion_of :to_from, :in => TO_FROM_TYPES

end
