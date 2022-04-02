# frozen_string_literal: true

OmniAuth.config.on_failure = proc do |env|
  message_key = env["omniauth.error.type"]
  error_description = Rack::Utils.escape(env["omniauth.error"]&.full_message)
  new_path = "#{env["SCRIPT_NAME"]}#{OmniAuth.config.path_prefix}/failure?error_type=#{message_key}&error_msg=#{error_description}"
  Rails.logger.error(env["omniauth.error"])
  Rack::Response.new(["302 Moved"], 302, "Location" => new_path).finish
end
