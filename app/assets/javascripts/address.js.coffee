# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('#city_name_auto_complete').autocomplete
    source: $('#city_name_auto_complete').data('autocomplete-source')
    minLength: 3
