class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.super_admin?
      can :manage, :all
    elsif user.support_admin?
      can :manage, Candidate
      can :manage, Employer
      can :manage, Organization
    elsif user.content_admin?
      # nothing for now
    elsif user.candidate?
      can :update, Candidate do |candidate|
        candidate == user
      end
    elsif user.employer?
      can :update, Employer do |employer|
        employer == user
      end
    elsif user.owner?
      can :update, Organization do |organization|
        organization == user.organization
      end
    end
  end
end
