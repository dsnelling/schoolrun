# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# ---datepicker - from jquery-ui
$.datepicker.setDefaults({
  dateFormat: 'dd-mm-yy',
  firstDay: 1
});

$ -> $('.datepicker').datepicker();

# ---tooltip - from jquerytools
$ -> $('.ttip').tooltip({
  opacity: 1.0,
  position: 'bottom center',
  offset: [0,15],
  effect: 'fade'
});


# --- overlay to pickup the comments for an event
#  from jquerytools
$ -> $("a[rel=#overlay1]").overlay
  onBeforeLoad: ->
    wrap = @getOverlay().find(".contentWrap")
    wrap.load @getTrigger().attr("href")



