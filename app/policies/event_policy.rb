class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    elevated_action?
  end

  def new?
    create?
  end

  def update?
    elevated_action?
  end

  def edit?
    update?
  end

  def destroy?
    elevated_action?
  end
end
