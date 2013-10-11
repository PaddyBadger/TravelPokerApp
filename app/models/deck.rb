class Deck < ActiveRecord::Base
  belongs_to :user
  has_many :likes, as: :likeable
  has_and_belongs_to_many :cards
  attr_accessible :image, :location, :title

  mount_uploader :image, ImageUploader
end
