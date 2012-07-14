# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('#city_name_token').tokenInput '/schools.json'
    theme: ''
    preventDuplicates: false
    minChars: 3
    tokenLimit: 1
    noResultsText: 'Населений пункт не знайдено'
    hintText: 'Почніть уводити назву'
    searchingText: 'Шукаємо...'
    deleteText: '<i class="icon-remove";></i>'
    prePopulate: $('#city_name_token').data('pre')
    propertyToSearch: 'name'
    resultsFormatter: (item) ->
      "<li>" + item.name + " (" + item.region.name + ")</li>"
    tokenFormatter: (item) ->
      "<li>" + item.name + " (" + item.region.name + ")</li>"



