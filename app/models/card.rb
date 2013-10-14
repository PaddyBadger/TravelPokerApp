class Card < ActiveRecord::Base
  belongs_to :user
  belongs_to :season
  belongs_to :category
  has_many :comments
  has_many :likes, as: :likeable
  has_and_belongs_to_many :decks
  attr_accessible :description, :image, :location, :title, :url

  mount_uploader :image, ImageUploader

  acts_as_gmappable process_geocoding: true

  def gmaps4rails_address
    #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    "#{self.location}" 
  end
end
