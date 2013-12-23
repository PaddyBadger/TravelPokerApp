class WelcomeController < ApplicationController
  respond_to :html, :js
  
  def index
    @cards = Card.order("created_at DESC").paginate(page: params[:page], per_page: 12)
    @decks = Deck.order("created_at DESC").paginate(page: params[:page], per_page: 8)
  end
end