class WelcomeController < ApplicationController
  respond_to :html, :js
  
  def index
    @cards = Card.paginate(page: params[:page], per_page: 12)
    @decks = Deck.paginate(page: params[:page], per_page: 8)
  end
end