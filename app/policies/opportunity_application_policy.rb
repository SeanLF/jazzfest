class OpportunityApplicationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    show?
  end

  def show?
    permission?('read:volunteer-application')
  end

  def create?
    permission?('create:volunteer-application')
  end

  def new?
    create?
  end

  def update?
    if record.profile.auth0_id == user['uid']
      permission?('edit:own-volunteer-application')
    else
      permission?('edit:volunteer-application')
    end
  end

  def edit?
    update?
  end

  def destroy?
    permission?('delete:volunteer-application')
  end

  def accept?
    permission?('accept:volunteer-application')
  end

  def reset?
    permission?('reset:volunteer-application')
  end

  def decline?
    permission?('decline:volunteer-application')
  end
end
