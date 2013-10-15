class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :image, :email, :password, :password_confirmation, :remember_me
  has_many :cards

  before_create :set_member
  
  has_many :decks
  has_many :likes
  has_many :comments
  has_many :votes
  # attr_accessible :title, :body

  ROLES = %w[member admin]
  def role?(base_role)
    role.nil? ? false : ROLES.index(base_role.to_s) <= ROLES.index(role)
  end  

  private

  def set_member
    self.role = 'member'
  end

  def self.top_rated
    self.select('users.*'). # Select all attributes of the user
        select('COUNT(DISTINCT comments.id) AS comments_count'). # Count the comments made by the user
        select('COUNT(DISTINCT posts.id) AS posts_count'). # Count the posts made by the user
        select('COUNT(DISTINCT comments.id) + COUNT(DISTINCT posts.id) AS rank'). # Add the comment count to the post count and label the sum as "rank"
        joins(:posts). # Ties the posts table to the users table, via the user_id
        joins(:comments). # Ties the comments table to the users table, via the user_id
        group('users.id'). # Instructs the database to group the results so that each user will be returned in a distinct row
        order('rank DESC') # Instructs the database to order the results in descending order, by the rank that we created in this query. (rank = comment count + post count)
  end
end
