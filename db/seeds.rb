# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
# create admin user, if doesn't exist
#
#
# seed data
Event.delete_all
Event.create(:title => 'Netball Club Pickup',
  :description => 'After school netball club',
  :to_from => 'From',
  :event_date => '2012-10-14',
  :event_time => '18:00',
  :location => 'LEH')
Event.create(:title => 'Lacrosse Club Pickup',
  :description => 'After school lacrosse club',
  :to_from => 'From',
  :event_date => '2012-10-15',
  :event_time => '18:00',
  :location => 'LEH')
Event.create(:title => 'Rowing Dropoff',
  :description => 'Weekend rowing club',
  :to_from => 'To',
  :event_date => '2012-10-18',
  :event_time => '13:00',
  :location => 'Boat House')
Event.create(:title => 'Rowing Pickup',
  :description => 'Weekend rowing club',
  :to_from => 'From',
  :event_date => '2012-10-18',
  :event_time => '16:00',
  :location => 'Boat House')

