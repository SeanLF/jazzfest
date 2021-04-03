class VolunteerOpportunityPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if role?('Coordinator') || role?('Admin')
        scope.all
      else
        scope.visible_or_applied_to(Pundit.policy_scope(user, OpportunityApplication))
      end
    end
  end

  def index?
    true
  end

  # show if in scope

  def create?
    elevated_action?
  end

  def new?
    create?
  end

  def update?
    elevated_action?
  end

  def edit?
    update?
  end

  def destroy?
    if elevated_action?
      !VolunteerOpportunity.applied_to_.pluck(:id).include?(record.id)
    else
      false
    end
  end
end
