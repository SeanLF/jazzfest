module Auth0Helper
  private

  # Is the user signed in?
  # @return [Boolean]
  def user_signed_in?
    auth0_session_present = session[:userinfo].present?
    if auth0_session_present
      @current_user = session[:userinfo]
    else
      @current_user = { 'extra' => { 'raw_info' => { 'permissions' => ['read:visible-volunteer-opportunity'] } } }
    end
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

  # @return the path to the login page
  def login_path
    root_path(anchor: 'authenticate_user')
  end
end
