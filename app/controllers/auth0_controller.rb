class Auth0Controller < ApplicationController
  after_action :skip_authorization

  def callback
    # OmniAuth places the User Profile information (retrieved by omniauth-auth0) in request.env['omniauth.auth'].
    # In this tutorial, you will store that info in the session, under 'userinfo'.
    # If the id_token is needed, you can get it from session[:userinfo]['credentials']['id_token'].
    # Refer to https://github.com/auth0/omniauth-auth0#auth-hash for complete information on 'omniauth.auth' contents.
    session[:userinfo] = request.env['omniauth.auth'].except('info')

    # Create a profile for new signups
    raw_info = request.env['omniauth.auth']['extra']['raw_info']
    auth0_id = request.env['omniauth.auth']['uid']

    profile = Profile.find_by(auth0_id: auth0_id)

    if profile.nil?
      Profile.new(
        auth0_id: auth0_id,
        email: raw_info['email'],
        first_name: raw_info['given_name'],
        last_name: raw_info['family_name']
      ).save(validate: false)
    end

    redirect_to apply_path
  end

  # if user authentication fails on the provider side OmniAuth will redirect to /auth/failure,
  # passing the error message in the 'message' request param.
  def failure
    @error_msg = request.params['message']
  end
end
