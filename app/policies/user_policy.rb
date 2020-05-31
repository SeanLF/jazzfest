# frozen_string_literal: true

# Policy to authorize users
class UserPolicy < ResourcePolicy
  # Defines authorized scopes for users
  class Scope < Scope
    def applicant_scope
      scope.where(auth0_id: user.uid)
    end

    def coordinator_scope
      applicant_scope
    end
  end

  def permitted_attributes
    []
  end
end
