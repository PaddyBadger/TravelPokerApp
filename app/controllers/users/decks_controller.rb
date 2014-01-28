class Users::DecksController < ApplicationController
  def index
    @decks = User.find(params[:user_id]).decks
    @decks = @decks.paginate(page: params[:page], per_page: 12)
  end

  def show
    @decks = User.find(params[:user_id]).decks
    @decks = @decks.paginate(page: params[:page], per_page: 12)
  end
end