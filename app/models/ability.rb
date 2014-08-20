class Ability
  include CanCan::Ability
  attr_reader :user

  # roles
  # - staff
  # - playbox manager
  # - admin
  # - directors??

  def initialize user
    @user = user || User.new # guest user (not logged in)
    add_album_abilities
    add_artist_abilities
    add_play_abilities
    add_track_abilities
    add_user_abilities
  end

  private

  def add_album_abilities
    if @user.staff?
      can :create, Album
    end
    if @user.admin?
      can :manage, Album
    end
  end

  def add_artist_abilities
    if @user.staff?
      can :create, Artist
    end
    if @user.admin?
      can :manage, Artist
    end
  end

  def add_play_abilities
    if @user.persisted?
      can :read, Play
    end
    if @user.staff?
      can :create, Play, user_id: @user.id
      can :update, Play, user_id: @user.id
      can :destroy, Play, user_id: @user.id
    end
    if @user.admin?
      can :manage, Play
    end
  end

  def add_track_abilities
    if @user.staff?
      can :create, Track
    end
    if @user.admin?
      can :manage, Track
    end
  end

  def add_user_abilities
    can :read, User, id: @user.id
    can :update, User, id: @user.id
    can :destroy, User, id: @user.id

    if @user.admin?
      can :read, User
      can :update, User
      can :destroy, User
    end
  end
end
