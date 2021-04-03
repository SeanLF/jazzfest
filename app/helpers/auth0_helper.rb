module Auth0Helper
  private

  # Is the user signed in?
  # @return [Boolean]
  def user_signed_in?
    auth0_session_present = session[:userinfo].present?
    @current_user = (session[:userinfo] if auth0_session_present)
    auth0_session_present
  end

  # Set the @current_user or redirect to public page
  def authenticate_user!
    # Redirect to page that has the login here
    redirect_to login_path, notice: 'Please log in or sign up first' unless user_signed_in?
  end

  # What's the current_user?
  # @return [Hash]
  def current_user
    @current_user
  end

  def current_user_profile
    Profile.find_by(auth0_id: current_user['uid'])
  end

  def current_user_profile_rollbar_js
    current_user_js = current_user_profile
    { id: current_user_js.id, username: current_user_js.auth0_id, email: current_user_js.email }.to_json
  end

  def role?(role)
    (current_user || user)&.extra&.raw_info&.roles&.include?(role)
  end

  def applicant?
    role?('Applicant')
  end

  def coordinator?
    role?('Coordinator')
  end

  def admin?
    role?('Administrator')
  end

  def at_least_coordinator?
    coordinator? || admin?
  end
end
