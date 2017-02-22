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
    permission?('create:event')
  end

  def new?
    create?
  end

  def update?
    permission?('edit:event')
  end

  def edit?
    update?
  end

  def destroy?
    permission?('delete:event')
  end
end
