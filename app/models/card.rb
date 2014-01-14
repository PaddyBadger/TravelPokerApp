class Card < ActiveRecord::Base
  belongs_to :user
  belongs_to :season
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  has_and_belongs_to_many :decks, uniq: true
  attr_accessible :description, :image, :remote_image_url, :location, :title, :url, :season, :category, :slugged, :category_id, :season_id

  mount_uploader :image, ImageUploader

  extend FriendlyId
  friendly_id :title, use: :slugged

  acts_as_gmappable process_geocoding: true, check_process: false

  def gmaps4rails_address
    #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    "#{self.location}" 
  end
  
  validates :title, length: { 
    minimum: 5,
    maximum: 50 }
  validates :description, length: { minimum: 20 }
  validates :user, presence: true 

end
