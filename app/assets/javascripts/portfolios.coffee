# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


go = undefined
set_positions = undefined

set_positions = ->
  $('.card').each (i) ->
    $(this).attr 'data-pos', i + 1
    return
  return

go = ->
  set_positions()
  $('.sortable').sortable()
  $('.sortable').sortable().bind 'sortupdate', (e, ui) ->
    updated_order = []
    set_positions()
    $('.card').each (i) -> 
      updated_order.push
        id: $(this).data('id')
        position: $(this).data('pos')
      return
    $.ajax
      type: 'PUT'
      url: 'portfolios/sort'
      data: order: updated_order
    return
  return

$(document).ready go