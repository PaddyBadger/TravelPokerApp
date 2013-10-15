class Comment < ActiveRecord::Base
  belongs_to :card
  belongs_to :user
  has_many :votes
  attr_accessible :description, :title

  validates :body, length: { minimum: 5 }, presence: true
  validates :user, presence: true 
end
