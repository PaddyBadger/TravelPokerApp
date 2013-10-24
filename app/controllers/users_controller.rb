class UsersController < ApplicationController 
  respond_to :html, :js
  
  def index
    @users = User.top_rated.paginate(page: params[:page], per_page: 10)
  end

  def show
    @user = User.find(params[:id])
    authorize! :reader, @user, message: "blahblah"
  end
end