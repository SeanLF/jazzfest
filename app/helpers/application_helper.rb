# frozen_string_literal: true

# Global application helper
module ApplicationHelper
  # App Name Helper
  # Pull the application name set in config/application.rb
  # Call with appname in page layouts like <%= appname %>
  # @return [String]
  def appname
    @appname = Rails.application.appname
  end

  def global_flash_class(global_flash_key)
    case global_flash_key
    when 'global_alert'
      'is-danger'
    when 'global_notice'
      'is-success'
    else
      'is-info'
    end
  end
end
