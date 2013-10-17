class CardsDecksController < ApplicationController
  def create
    @card = Cards.find(params[:card_id])
    @deck = Deck.find(params[:deck_id])
    @card.decks << @deck
  end

  def destroy
    @card = Cards.find(params[:card_id])
    @deck = Deck.find(params[:deck_id])
    @card.decks.delete(@deck)
  end
end