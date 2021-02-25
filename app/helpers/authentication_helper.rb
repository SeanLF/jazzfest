# frozen_string_literal: true

# Helper for all things related to authenticating users
module AuthenticationHelper
  include ::Auth0::AuthenticationConcern

  # define login path as an immutable constant
  AUTH0_LOGIN_PATH = '/auth/auth0'

  # @returns [String]
  def auth0_login_path
    AUTH0_LOGIN_PATH
  end
end
