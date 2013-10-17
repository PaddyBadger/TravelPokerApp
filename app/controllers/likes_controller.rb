class LikesController < ApplicationController
  before_filter :load_likeable

  def create
    @like = @likeable.likes.new(params[:like])
    @like.user = current_user

    if @like.save
      flash[:notice] = "Liked!"
      redirect_to @likeable
    else
      flash[:error] = "There was an error liking. Please try again."
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @likeable = @like.likeable

    if @like.destroy
      flash[:notice] = "Unliked!"
      redirect_to @likeable
    else
      flash[:error] = "There was an error unliking. Please try again."
    end
  end

  private

  def load_likeable
    cls, id = request.path.split("/")[1..2]
    @likeable = cls.singularize.classify.constantize.find(id)
  end 
end
