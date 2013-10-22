class Users::DecksController < ApplicationController
  def index
    @decks = User.find(params[:user_id]).decks.paginate(page: params[:page], per_page: 12)
  end
end