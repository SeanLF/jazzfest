# frozen_string_literal: true

class OpportunityApplicationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if admin?
        scope.all
      elsif coordinator?
        scope.submitted
      elsif role?("Applicant")
        scope.where(profile_id: Profile.find_by(auth0_id: user["uid"]).id)
      else
        scope.none
      end
    end
  end

  def index?
    at_least_coordinator?
  end

  def show?
    return true if at_least_coordinator?

    super
  end

  def create?
    role?("Applicant")
  end

  def update?
    return true if record.profile.auth0_id == user["uid"]

    at_least_coordinator?
  end

  def destroy?
    role?("Administrator")
  end

  def review?
    at_least_coordinator?
  end

  def permitted_attributes
    attributes = []
    attributes << :availability << :choices << :submitted if applicant? || admin?
    if at_least_coordinator?
      attributes << :opportunity_application_status_id << :coordinator_notes << :accepted_volunteer_opportunity_id
    end
    attributes
  end
end
