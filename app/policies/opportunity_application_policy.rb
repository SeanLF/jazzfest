class OpportunityApplicationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if permission?('read:volunteer-application')
        scope.all
      elsif permission?('edit:own-volunteer-application')
        scope.where(profile_id: Profile.find_by(auth0_id: user['uid']).id)
      else
        scope.none
      end
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

  def permitted_attributes
    attributes = [:availability, :choices, :submitted]
    attributes << :profile_id if permission?('edit:volunteer-application')
    attributes << :opportunity_application_status_id << :coordinator_notes << :accepted_volunteer_opportunity_id if role?('Coordinator') || role?('Admin')
    attributes
  end
end
