class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    # if a member, they can manage their own posts 
    # (or create new ones)
    if user.role? :member
      can :read, User, id: user.id
      can :manage, Deck, :user_id => user.id
      can :manage, Card, :user_id => user.id
      can :manage, Comment, :user_id => user.id
      can :create, Vote
      can :create, Like
      can :create, Done
    end

    if user.role? :admin
      can :manage, :all
    end
  end
end
