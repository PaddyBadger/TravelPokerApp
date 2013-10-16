class Vote < ActiveRecord::Base
  belongs_to :comment
  belongs_to :user
  attr_accessible :vote, :comment

  validates :vote, inclusion: { in: [-1, 1], message: "%{vote} is not a valid vote." }

  # after_save :update_comment

  def up_vote?
    vote == 1
  end

  def down_vote?
    vote == -1
  end

  private

  # def update_comment
  #   self.post.update_rank 
  # end
end
