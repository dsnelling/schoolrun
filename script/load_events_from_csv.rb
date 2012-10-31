# script for bulk import of events
# CSV to be formatted as follows
# 
#title,description,to_from,location,event_date,event_time,status
#event 1,test event 1,To,LEH,2012-11-1,16:00,
# (its a bit fussy, so don't put spaces in the header row, make
# sure "To" and "From" are have first letter as caps, etc
#
# run as "rails runnner script/load_events_from_csv.rb"

require 'csv'
CSV.foreach('tmp/events_import.csv', :headers => true) do |row|
  Event.create!(row.to_hash)
end

