class VolunteerOpportunityPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if permission?('read:volunteer-opportunity')
        scope.all
      elsif permission?('read:visible-volunteer-opportunity')
        scope.visible_or_applied_to(Pundit.policy_scope(user, OpportunityApplication))
      end
    end
  end

  def index?
    true
  end

  # show if in scope

  def create?
    permission?('create:volunteer-opportunity')
  end

  def new?
    create?
  end

  def update?
    permission?('edit:volunteer-opportunity')
  end

  def edit?
    update?
  end

  def destroy?
    if permission?('delete:volunteer-opportunity')
      !VolunteerOpportunity.applied_to_.pluck(:id).include?(record.id)
    else
      false
    end
  end
end