class SettingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    elevated_action?
  end

  def show?
    false
  end

  def update?
    elevated_action?
  end

  def destroy?
    false
  end

  def permitted_params
    [:value]
  end
end
