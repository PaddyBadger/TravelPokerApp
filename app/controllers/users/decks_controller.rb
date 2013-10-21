class Users::DecksController < ApplicationController
  def index
    @decks = User.find(params[:user_id]).decks.paginate(page: params[:page], per_page: 12)
  end

  def create
    @deck = Deck.find(params[:deck_id])
    current_user.decks << @deck
    @deck.save
    redirect_to :back
    # if @deck.save
    # else
    # end
  end
end