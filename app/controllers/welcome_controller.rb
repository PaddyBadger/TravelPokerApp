class WelcomeController < ApplicationController
  respond_to :html, :js, :xml, :json
  
  def index
    @cards = Card.order('created_at DESC').paginate(page: params[:page], per_page: 12)
    @decks = Deck.paginate(page: params[:page], per_page: 100)
  end
end