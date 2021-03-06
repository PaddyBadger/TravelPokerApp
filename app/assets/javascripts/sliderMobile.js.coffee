# Selects all elements with same `card_#{n}` as container of matched elements
$.fn.cardid = ->
  c = $(this).closest('.card').attr('class').match(/card_\d+/)
  $('.' + c)


  # Show back of clicked card, hiding all other backs
showBackMobile = ->
  $('.twistCardMobile').removeClass('animateBack')
  $('.trip').removeClass('animateFront')
  $(this).cardid().find('.twistCardMobile').addClass('animateBack')
  $(this).cardid().find('.trip').addClass('animateFront')

# Hide Card Back on click
hideBackMobile = ->
    $('.backMobile').removeClass('animateBack')
    $(this).find('.twistCardMobile').removeClass('animateBack')
    $(this).cardid().find('.trip').removeClass('animateFront')
  
# Main
$ ->
  $('.card.trip').click(showBackMobile)
  $('.backMobile').click(hideBackMobile) 