class ApplicationPolicy
  include ::Auth0::AuthenticationConcern
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def elevated_action?
    @user.coordinator? || @user.admin?
  end
end