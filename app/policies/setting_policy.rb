class SettingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    permission?('read:setting')
  end

  def show?
    false
  end

  def update?
    permission?('edit:setting')
  end

  def destroy?
    false
  end

  def permitted_params
    [:value]
  end
end
