# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



$(document).ready ->
  console.log("Dynamic country select OK!!!!")
  $("#locations_select").on "change", ->
    $.ajax
      url: "/collections/update_families"
      type: "GET"
      dataType: "script"
      data:
        location_id: $('#locations_select option:selected').val()        