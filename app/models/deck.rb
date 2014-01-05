class Deck < ActiveRecord::Base
  belongs_to :user
  has_many :likes, as: :likeable, dependent: :destroy
  has_and_belongs_to_many :cards, uniq: true
  attr_accessible :image, :remote_image_url,:description, :title, :slugged

  mount_uploader :image, ImageUploader

  validates :title, length: { minimum: 5 }, presence: true
  validates :user, presence: true 

  extend FriendlyId
  friendly_id :title, use: :slugged

  searchable do
    text :title, :description, :location, :comments, :category, :season
  end
end
