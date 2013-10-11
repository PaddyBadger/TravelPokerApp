class WelcomeController < ApplicationController
  def index
    @cards = Card.paginate(page: params[:page], per_page: 4)
    @decks = Deck.paginate(page: params[:page], per_page: 4)
  end
end