class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    can :read, :all
    if user.present?
      can :create, Comment, user_id: user.id

      if user.admin?
        can :manage, :all
      end
    end
  end
end
