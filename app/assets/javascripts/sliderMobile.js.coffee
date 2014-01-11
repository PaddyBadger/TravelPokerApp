
# Selects all elements with same `card_#{n}` as container of matched elements
$.fn.card = ->
  c = $(this).closest('.card').attr('class').match(/card_\d+/)
  $('.' + c)


  # Show back of clicked card, hiding all other backs
showBack = ->
  $('.twistCardMobile').removeClass('animateBack')
  $('.trip').removeClass('animateFront')
  $(this).card().find('.twistCardMobile').addClass('animateBack')
  $(this).card().find('.trip').addClass('animateFront')

# Hide Card Back on click
hideBack = ->
    $('.backMobile').removeClass('animateBack')
    $(this).find('.twistCardMobile').removeClass('animateBack')
    $(this).card().find('.trip').removeClass('animateFront')
  
# Main
$ ->
  $('.card.trip').click(showBack)
  $('.backMobile').click(hideBack) 