class Comment < ActiveRecord::Base
  belongs_to :card
  belongs_to :user
  has_many :votes
  attr_accessible :description, :title
end
