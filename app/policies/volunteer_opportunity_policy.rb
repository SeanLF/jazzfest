# frozen_string_literal: true

class VolunteerOpportunityPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if at_least_coordinator?
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
    at_least_coordinator?
  end

  def update?
    at_least_coordinator?
  end

  def destroy?
    if at_least_coordinator?
      !VolunteerOpportunity.applied_to_.pluck(:id).include?(record.id)
    else
      false
    end
  end
end
