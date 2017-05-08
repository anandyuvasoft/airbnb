# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
  # google autocomplete location input on room edit and first step
  if $("#room_address").length > 0
    map = new (google.maps.Map)(document.getElementById('room_address'),
      center:
        lat: -33.8688
        lng: 151.2195
      zoom: 13)
    input = document.getElementById('room_address')
    autocomplete = new (google.maps.places.Autocomplete)(input)
    return