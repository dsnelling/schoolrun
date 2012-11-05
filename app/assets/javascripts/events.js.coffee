# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# ---datepicker
$.datepicker.setDefaults({
  dateFormat: 'dd-mm-yy',
  firstDay: 1
});


#$ -> $("#event_event_date").datepicker();

$ -> $('.datepicker').datepicker();

