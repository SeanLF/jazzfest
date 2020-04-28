module AuthenticationHelper
  include ::Auth0::AuthenticationConcern
  include ::Rollbar::AuthenticationConcern
  
  # define login path as an immutable constant
  AUTH0_LOGIN_PATH = '/auth/auth0'.freeze
  
  # @returns [String]
  def auth0_login_path
    AUTH0_LOGIN_PATH
  end

  # Current User to JSON, only includes the user's auth0 UID
  # @return [String]
  def current_user_for_rollbar_js
    _current_user_for_rollbar = current_user_for_rollbar
    {id: _current_user_for_rollbar.id}.to_json
  end
end