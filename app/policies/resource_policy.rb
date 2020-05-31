# frozen_string_literal: true

# Resource Policy Interface
class ResourcePolicy < ApplicationPolicy
  def permitted_attributes
    []
  end

  def index?
    user.admin?
  end

  def new?
    create?
  end

  def create?
    user.admin? or !permitted_attributes.empty?
  end

  def show?
    scope.where(id: record.id).exists?
  end

  def edit?
    update?
  end

  def update?
    scope.where(id: record.id).exists? or !permitted_attributes.empty?
  end

  def destroy?
    scope.where(id: record.id).exists?
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  # Resource Policy Scope Interface
  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.admin?
        admin_scope
      elsif user.coordinator?
        coordinator_scope
      elsif user.applicant?
        applicant_scope
      else
        anonymous_scope
      end
    end

    def admin_scope
      scope.all
    end

    def coordinator_scope
      scope
    end

    def applicant_scope
      scope.none
    end

    def anonymous_scope
      scope.none
    end
  end
end
