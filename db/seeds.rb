# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# create admin user, if doesn't exist

unless User.find_by_name("admin01")
    a = User.new(
      :name => "admin01",
      :role => "Admin",
      :email => "somewhere@elsewhere.com",
      :password => "secret01",
      :password_confirmation => "secret01",
      :first_name => "Mr",
      :surname => "Admin")
    a.save
  end


#
#
# seed data

=begin
Event.delete_all
Event.create(:title => 'Netball Club Pickup',
  :description => 'After school netball club',
  :to_from => 'From',
  :event_date => '2013-10-14',
  :event_time => '18:00',
  :location => 'LEH')
Event.create(:title => 'Lacrosse Club Pickup',
  :description => 'After school lacrosse club',
  :to_from => 'From',
  :event_date => '2013-10-15',
  :event_time => '18:00',
  :location => 'LEH')
Event.create(:title => 'Rowing Dropoff',
  :description => 'Weekend rowing club',
  :to_from => 'To',
  :event_date => '2013-10-18',
  :event_time => '13:00',
  :location => 'Boat House')
Event.create(:title => 'Rowing Pickup',
  :description => 'Weekend rowing club',
  :to_from => 'From',
  :event_date => '2012-10-18',
  :event_time => '16:00',
  :location => 'Boat House')
=end
