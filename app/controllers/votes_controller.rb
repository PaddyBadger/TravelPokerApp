class VotesController < ApplicationController
  respond_to :html, :js
  
  before_filter :setup

  def up_vote
    update_vote(1)
  end

  def down_vote
    update_vote(-1)
  end

  private

  def setup 
    @comment = Comment.find(params[:comment_id])
    @vote = @comment.votes.where(user_id: current_user.id).first
   
  end

  def update_vote(new_vote)
    if @vote # if it exists, update it
      @vote.update_attribute(:vote, new_vote)
    else # create it
      @vote = current_user.votes.create(vote: new_vote, comment: @comment)
    end

    respond_with(@vote) do |f|
      f.html { redirect_to @comment }
      f.js { render :update }
    end
  end
end