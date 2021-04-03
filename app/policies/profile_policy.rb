class ProfilePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if admin?
        scope.all
      elsif coordinator?
        scope.with_published_opportunity_applications
      elsif applicant?
        scope.where(auth0_id: user['uid'])
      else
        scope.none
      end
    end
  end

  def index?
    at_least_coordinator?
  end

  def create?
    applicant?
  end

  def update?
    return true if record.auth0_id == user['uid']

    admin?
  end

  def destroy?
    admin?
  end

  def permitted_attributes
    attributes = []
    if applicant? || admin?
      attributes << %i[email first_name last_name address city province postal_code home_phone_number cell_phone_number work_phone_number t_shirt_size age_group emergency_contact_name emergency_contact_number notes code_of_conduct]
    end
    attributes
  end
end
