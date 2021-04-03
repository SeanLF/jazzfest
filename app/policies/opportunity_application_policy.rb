class OpportunityApplicationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if role?('Coordinator') || role?('Administrator')
        scope.all
      elsif role?('Applicant')
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
    user.exists?
  end

  def create?
    role?('Applicant')
  end

  def new?
    create?
  end

  def update?
    edit? || role?('Coordinator')
  end

  def edit?
    if record.profile.auth0_id == user['uid']
      true
    else
      role?('Administrator')
    end
  end

  def destroy?
    role?('Administrator')
  end

  def review?
    role?('Coordinator') || role?('Administrator')
  end

  def permitted_attributes
    attributes = []
    attributes << :availability << :choices << :submitted if edit?
    attributes << :profile_id if role?('Administrator')
    if role?('Coordinator') || role?('Administrator')
      attributes << :opportunity_application_status_id << :coordinator_notes << :accepted_volunteer_opportunity_id
    end
    attributes
  end
end
