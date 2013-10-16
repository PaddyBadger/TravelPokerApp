class CommentsController < ApplicationController
  def create
    @card = Card.find(params[:card_id])
    
    @comment = current_user.comments.build(params[:comment])
    authorize! :create, Comment, message: "Please Register with TravelPoker to make comments."
    @comment.card = @card

      if @comment.save
        flash[:notice] = "Comment was created."
      else
        flash[:error] = "There was an error saving the comment. Please try again."
      end
      redirect_to [@card]
  end

  def update
    @card = Card.find(params[:card_id])

    @comment = @card.comments.find(params[:id])
    authorize! :update, comment, message: "You must own a comment to edit or delete it."
    
      if @comment.update_attributes(params[:card_id])
        flash[:notice] = "comment was updated."
        redirect_to @card, notice: "comment was saved successfully."
      else
        flash[:error] = "There was an error saving the comment. Please try again."
        render :edit
      end
  end

  def destroy
    @card = Card.find(params[:card_id])

    @comment = @card.comments.find(params[:id])

    if @comment.destroy
      flash[:notice] = "Comment was removed."
    else
      flash[:error] = "Comment couldn't be deleted. Try again."
    end
    redirect_to [@card]
  end
end
