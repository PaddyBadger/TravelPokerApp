class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable,
         :omniauthable, :omniauth_providers => [:facebook]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :image, :email, :password, :password_confirmation, :remember_me, :provider, :uid
  has_many :cards
  has_many :decks
  has_many :likes, dependent: :destroy
  has_many :liked_cards, through: :likes, source: :likeable, source_type: 'Card'
  has_many :liked_decks, through: :likes, source: :likeable, source_type: 'Deck'
  has_many :dones, dependent: :destroy
  has_many :done_cards, through: :dones, source: :doable, source_type: 'Card'
  has_many :done_decks, through: :dones, source: :doable, source_type: 'Deck'
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy

  before_create :set_member
  # attr_accessible :title, :body

  ROLES = %w[member admin]
  def role?(base_role)
    role.nil? ? false : ROLES.index(base_role.to_s) <= ROLES.index(role)
  end  

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      pass = Devise.friendly_token[0,20]
      user = User.new(name:auth.extra.raw_info.name,
                         provider:auth.provider,
                         uid:auth.uid,
                         email:auth.info.email,
                         password: pass,
                         password_confirmation: pass
                        )
      user.skip_confirmation!
      user.save
    end
    user
  end

  def liked(likeable)
    self.likes.where(likeable_id: likeable.id, likeable_type: likeable.class.to_s).first
  end

   def done(doable)
    self.dones.where(doable_id: doable.id, doable_type: doable.class.to_s).first
  end

  def voted(comment)
    self.votes.where(comment_id: comment.id).first
  end

  private

  def set_member
    self.role = 'member'
  end

  # def self.top_rated
  #   self.select('users.*'). # Select all attributes of the user
  #       select('COUNT(DISTINCT comments.id) AS comments_count'). # Count the comments made by the user
  #       select('COUNT(DISTINCT posts.id) AS posts_count'). # Count the posts made by the user
  #       select('COUNT(DISTINCT comments.id) + COUNT(DISTINCT posts.id) AS rank'). # Add the comment count to the post count and label the sum as "rank"
  #       joins(:posts). # Ties the posts table to the users table, via the user_id
  #       joins(:comments). # Ties the comments table to the users table, via the user_id
  #       group('users.id'). # Instructs the database to group the results so that each user will be returned in a distinct row
  #       order('rank DESC') # Instructs the database to order the results in descending order, by the rank that we created in this query. (rank = comment count + post count)
  # end
end
