class Season < ActiveRecord::Base
  attr_accessible :name, :image

  has_many :cards
  has_many :decks, through: :cards
end
