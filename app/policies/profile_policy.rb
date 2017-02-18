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
end
