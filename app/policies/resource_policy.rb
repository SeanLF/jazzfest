# frozen_string_literal: true

# Resource Policy Interface
class ResourcePolicy < ApplicationPolicy
  def index?
    false
  end

  def show?
    scope.where(id: record.id).exists?
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    scope.where(id: record.id).exists?
  end

  def edit?
    update?
  end

  def destroy?
    scope.where(id: record.id).exists?
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  # Resource Policy Scope Interface
  class Scope
    include ::Auth0::AuthenticationConcern
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

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
