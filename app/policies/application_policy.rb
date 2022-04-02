# frozen_string_literal: true

class ApplicationPolicy
  include Auth0Helper
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

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
    # in case record is already a class
    klass = record.is_a?(ActiveRecord::Base) ? record.class : record
    Pundit.policy_scope!(user, klass)
  end

  class Scope
    include Auth0Helper
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
