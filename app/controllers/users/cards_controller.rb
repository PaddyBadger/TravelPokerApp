class Users::CardsController < ApplicationController  
  def index
    @cards = User.find(params[:user_id]).cards.paginate(page: params[:page], per_page: 12)
  end
end