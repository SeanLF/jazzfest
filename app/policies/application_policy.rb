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

  def elevated_action?
    role?('Coordinator') || role?('Administrator')
  end

  def scope
    Pundit.policy_scope!(user, record.class)
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
