# frozen_string_literal: true

class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if at_least_coordinator?
        scope.all
      else
        scope.active
      end
    end
  end

  def index?
    true
  end

  def create?
    at_least_coordinator?
  end

  def update?
    at_least_coordinator?
  end

  def destroy?
    at_least_coordinator?
  end
end
