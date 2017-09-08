class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role? == "General Manager"
      can :manage, :all
        elsif user.role? == "Property Manager"
          can [:read, :create, :update,:destroy], User
          can [:read, :create, :update,:destroy], Property
          can :read, :all
        elsif user.role? == "Blog Manager"
          can [:manage], [News, Blog]
        else
          can [:read], :all
    end
  end
end
