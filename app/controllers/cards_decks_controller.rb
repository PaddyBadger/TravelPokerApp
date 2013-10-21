class CardsDecksController < ApplicationController
  respond_to :html, :js

  def create
    @card = Card.find(params[:card_id])
    @deck = Deck.find(params[:deck_id])
    @card.decks << @deck
    respond_with(@card,@deck, location: :root)
  end

  def destroy
    @card = Card.find(params[:card_id])
    @deck = Deck.find(params[:deck_id])
    @card.decks.delete(@deck)
    respond_with(@card,@deck, location: :root)
  end
end