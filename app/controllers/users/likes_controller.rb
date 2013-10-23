class Users::LikesController < ApplicationController  
  def index
    @likes = User.find(params[:user_id]).likes.paginate(page: params[:page], per_page: 12)
  end
end