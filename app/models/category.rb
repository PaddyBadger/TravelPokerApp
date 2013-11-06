class Category < ActiveRecord::Base
  attr_accessible :image, :title
  has_many :cards
  has_many :decks, through: :cards
  #specifies decks have categories through cards
  
end
