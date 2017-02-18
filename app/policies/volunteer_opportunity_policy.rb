class VolunteerOpportunityPolicy < ApplicationPolicy
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
    permission?('create:volunteer-opportunity')
  end

  def new?
    create?
  end

  def update?
    permission?('edit:volunteer-opportunity')
  end

  def edit?
    update?
  end

  def destroy?
    permission?('delete:volunteer-opportunity')
  end
end
