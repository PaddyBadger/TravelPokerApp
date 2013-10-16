class VotesController < ApplicationController
  before_filter :setup

  def up_vote
    update_vote(1)
    redirect_to :back
  end

  def down_vote
    update_vote(-1)
    redirect_to :back
  end
  
  private

  def setup 
    @comment = Comments.find(params[:card_id])
    @vote = @comment.votes.where(user_id: current_user.id).first
   
  end

  def update_vote(new_value)
    if @vote # if it exists, update it
      @vote.update_attribute(:value, new_value)
    else # create it
      @vote = current_user.votes.create(value: new_value, comment: @comment)
    end
  end

end