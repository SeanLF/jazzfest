# frozen_string_literal: true

require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Jazzfest
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults(7.0)

    config.i18n.load_path += Dir[Rails.root.join("config/locales/**/*.{rb,yml}")]
    I18n.available_locales = [:en, :fr]
    config.i18n.default_locale = :en
    config.active_model.i18n_customize_full_message = true
    config.active_record.default_timezone = :local

    config.time_zone = "Eastern Time (US & Canada)"
    config.beginning_of_week = :monday

    # Application Name Definition - called with Rails.application.appname or via Pages Helper Method
    def appname
      @appname = "Jazzify"
    end

    config.generators do |g|
      g.scaffold_stylesheet(false)
    end
  end
end
