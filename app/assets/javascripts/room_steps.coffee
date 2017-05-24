# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
  $('.chosen-select').chosen
    allow_single_deselect: true
    no_results_text: 'No results matched'
    width: '100%'

  $('#step_2').on 'click', (e) ->
    inputs = $('.tag.label.label-info').text()
    $('#email_ids').val inputs
    if $('#email_ids').val()
      $('form').submit()
    return

  $(document).ready ->
    $('.bootstrap-tagsinput').tagsinput confirmKeys: [ 13 ]
    return    

  
