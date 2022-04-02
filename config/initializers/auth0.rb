# frozen_string_literal: true

Rails.application.config.middleware.use(OmniAuth::Builder) do
  provider(
    :auth0,
    Rails.application.credentials[:auth0][:client_id],
    Rails.application.credentials[:auth0][:client_secret],
    Rails.application.credentials[:auth0][:domain],
    callback_path: Rails.application.credentials[:auth0][:callback_path],
    authorize_params: {
      scope: "openid email profile",
    }
  )
end
