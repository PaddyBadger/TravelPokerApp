class Category < ActiveRecord::Base
  attr_accessible :image, :name
  has_many :cards
  has_many :decks, through: :cards
  #specifies decks have categories through cards
  
end
