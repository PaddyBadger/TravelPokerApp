class Users::DonesController < ApplicationController  
  def index
    @dones = User.find(params[:user_id]).dones.paginate(page: params[:page], per_page: 12)
  end
end