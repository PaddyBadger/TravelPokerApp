class Like < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :likeable, polymorphic: true, counter_cache: true
  belongs_to :user
end
