class Vote < ActiveRecord::Base
  belongs_to :comment
  belongs_to :user
  attr_accessible :vote
end
