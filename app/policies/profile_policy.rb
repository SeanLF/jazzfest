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
    permission?('read:profile')
  end

  def create?
    permission?('create:profile')
  end

  def new?
    create?
  end

  def update?
    if record.auth0_id == user['uid']
      permission?('edit:own-profile')
    else
      permission?('edit:profile')
    end
  end

  def edit?
    permission?('edit:profile')
  end

  def destroy?
    permission?('delete:profile')
  end

  def permitted_attributes
    attributes = [:email, :first_name, :last_name, :address, :city, :province, :postal_code, :home_phone_number, :cell_phone_number, :work_phone_number, :t_shirt_size, :age_group, :emergency_contact_name, :emergency_contact_number, :notes, :code_of_conduct]
    attributes << :auth0_id if permission?('create:profile') || permission?('edit:profile')
    attributes
  end
end
