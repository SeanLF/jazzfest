class ProfilePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    show?
  end

  def show?
    elevated_action?
  end

  def create?
    role?('Applicant')
  end

  def new?
    create?
  end

  def update?
    return true if record.auth0_id == user['uid']

    role?('Administrator')
  end

  def edit?
    role?('Applicant') || role?('Administrator')
  end

  def destroy?
    role?('Administrator')
  end

  def permitted_attributes
    attributes = []
    if role?('Applicant') || role?('Administrator')
      attributes << %i[email first_name last_name address city province postal_code home_phone_number cell_phone_number work_phone_number t_shirt_size age_group emergency_contact_name emergency_contact_number notes code_of_conduct]
    end
    attributes << :auth0_id if role?('Administrator')
    attributes
  end
end
