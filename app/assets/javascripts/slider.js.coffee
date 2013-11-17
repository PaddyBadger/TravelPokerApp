
# Evaluate to `f` if current selection is empty
$.fn.orElse = (f) ->
  if $(this).length
    $(this)
  else
    f()


# Selects all elements with same `card_#{n}` as container of matched elements
$.fn.card = ->
  c = $(this).closest('.card').attr('class').match(/card_\d+/)
  $('.' + c)



# Next card's front (cycling to last card front)
$.fn.nextCard = ->
  $(this).card().next('.trip').orElse(firstCard)
firstCard = ->
  $('.card.trip').first()

# Prev card's front (cycling to first card front)
$.fn.prevCard = ->
  $(this).card().prev('.trip').orElse(lastCard)
lastCard = ->
  $('.card.trip').last()



# Show back of clicked card, hiding all other backs
showBack = ->
  $('.back').addClass('hide')
  $('.searchIn').addClass('hide')
  $(this).card().removeClass('hide')
  
showNext = ->
  $(this).nextCard().trigger('click')
showPrev = ->
  $(this).prevCard().trigger('click')

# Hide Card Back on overlay click
hideBack = ->
    $('.back').addClass('hide')
    $('.searchIn').removeClass('hide')

#Add Map to Card
mapAdd = ->
  $(this).card().find('.location').geocomplete({map: $(this).card().find('.map'), location: $(this).card().find('.location').text()});;

# Main
$ ->
  $('.card.trip').click(showBack)
  $('.card.trip').click(mapAdd)
  $('.next').click(showNext)
  $('.next').click(mapAdd)
  $('.prev').click(showPrev)
  $('.prev').click(mapAdd)
  $('.twistCardBack').click(hideBack) 