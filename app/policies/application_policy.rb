# frozen_string_literal: true

# Application Policy interface
class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def elevated_action?
    @user.coordinator? || @user.admin?
  end

  # Policy Scope Interface
  class Scope
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
