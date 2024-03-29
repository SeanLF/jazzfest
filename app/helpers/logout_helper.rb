# frozen_string_literal: true

module LogoutHelper
  def logout_url
    domain = Rails.application.credentials.auth0[:domain]
    request_params = {
      returnTo: root_url,
      client_id: client_id,
    }

    URI::HTTPS.build(host: domain, path: "/logout", query: to_query(request_params))
  end

  private

  def to_query(hash)
    hash.map { |k, v| "#{k}=#{URI.escape(v)}" unless v.nil? }.reject(&:nil?).join("&")
  end
end
