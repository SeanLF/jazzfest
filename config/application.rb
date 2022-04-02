# frozen_string_literal: true

require_relative "boot"

# require "rails/all"
require "active_record/railtie"
# require "active_storage/engine"
require "action_controller/railtie"
require "action_view/railtie"
# require "action_mailer/railtie"
# require "active_job/railtie"
# require "action_cable/engine"
# require "action_mailbox/engine"
# require "action_text/engine"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Jazzfest
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.action_view.embed_authenticity_token_in_remote_forms = true
    config.time_zone = "Eastern Time (US & Canada)"
    config.middleware.insert_after(ActionDispatch::Static, Rack::Deflater)
  end
end
