# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
#u You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $("#entry_page").change (e)->
    $("#rangeValue1").val(this.value)

  $("#rangeValue1").click (e)->
    $("#entry_page").val(this.value)


