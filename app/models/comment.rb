class Comment < ActiveRecord::Base
  belongs_to :card
  belongs_to :user
  has_many :votes, dependent: :destroy
  attr_accessible :description, :title

  validates :description, length: { minimum: 5 }, presence: true
  validates :user, presence: true 

  def up_votes
    self.votes.where(value: 1).count
  end

  def down_votes
    self.votes.where(value: -1).count
  end  

  def points
    self.votes.sum(:vote).to_i
  end 
end
