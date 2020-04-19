module AuthenticationHelper
  include Authentication
  # @returns [String]
  def auth0_login_path
    '/auth/auth0'
  end
end