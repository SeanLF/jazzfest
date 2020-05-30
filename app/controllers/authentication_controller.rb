# frozen_string_literal: true

# Controller for de/authenticating users.
class AuthenticationController < ApplicationController
  # This redirects the user to the root path and highlights the login button
  def login
    redirect_to root_path(anchor: 'login')
  end

  # This stores all the user information that came from Auth0
  # and the IdP
  def callback
    data = request.env['omniauth.auth']
    session[:userinfo] = _data.slice('uid').merge(roles: data.extra.raw_info['https://jazzify.ca/roles'])

    # TODO: Redirect to requested resource or root path
    redirect_to root_path
  end

  # This handles authentication failures
  def failure
    @error_type = request.params['error_type']
    @error_msg = request.params['error_msg']
    # TODO: show a failure page or redirect to an error page
  end

  # This clears the sesion then logs out user of their oauth provider
  def logout
    reset_session
    redirect_to logout_url.to_s
  end

  private

  # This generates the url to log the user out of their oauth provider through Auth0
  def logout_url
    domain = Rails.application.credentials[:auth0][:domain]
    client_id = Rails.application.credentials[:auth0][:client_id]
    request_params = {
      returnTo: root_url,
      client_id: client_id
    }

    URI::HTTPS.build(host: domain, path: '/v2/logout', query: to_query(request_params))
  end

  def to_query(hash)
    hash.map { |k, v| "#{k}=#{CGI.escape(v)}" unless v.nil? }.reject(&:nil?).join('&')
  end
end
