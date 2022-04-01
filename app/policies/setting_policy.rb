# frozen_string_literal: true

class SettingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    at_least_coordinator?
  end

  def update?
    at_least_coordinator?
  end

  def destroy?
    false
  end

  def permitted_params
    [:value]
  end
end
