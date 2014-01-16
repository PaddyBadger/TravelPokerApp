class Done < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :doable, polymorphic: true
  belongs_to :user
end