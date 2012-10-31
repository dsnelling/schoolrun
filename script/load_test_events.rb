# loads 100 events for test data

#require 'active_suport/duration'
Event.transaction do
  (1..100).each do |i|
    Event.create(:title => "test event #{i}", :event_date => Time.now,
      :event_time => Time.now,  :to_from => "To", :location => "My House")
  end
end

