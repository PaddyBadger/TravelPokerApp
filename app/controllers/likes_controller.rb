class LikesController < ApplicationController
  respond_to :html, :js, :xml, :json
  
  before_filter :load_likeable

  def create
    @like = @likeable.likes.new(params[:like])
    @like.user = current_user
    authorize! :create, Like, message: "Please Register to Like."

    if @like.save
      flash[:notice] = "Liked!"
    else
      flash[:error] = "There was an error liking. Please try again."
    end

    respond_with(@likeable, location: @likeable)
  end

  def destroy
    @like = Like.find(params[:id])
    @likeable = @like.likeable

    if @like.destroy
      flash[:notice] = "Unliked!"
    else
      flash[:error] = "There was an error unliking. Please try again."
    end
    
    respond_with(@likeable, location: @likeable)
  end

  private

  def load_likeable
    cls, id = request.path.split("/")[1..2]
    @likeable = cls.singularize.classify.constantize.find(id)
  end 
end
