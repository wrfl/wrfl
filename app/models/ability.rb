class Ability
  include CanCan::Ability

  # roles
  # - staff
  # - playbox manager
  # - admin
  # - directors??

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    end

    if user.staff?
      can :create, Play
      can :update, Play, user_id: user.id
      can :destroy, Play, user_id: user.id

      can :update, User, id: user.id

      can :create, Album
      can :create, Artist
      can :create, Track

      can :read, :all
    end
  end
end
