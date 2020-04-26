module ApplicationHelper
  # App Name Helper
  # Pull the application name set in config/application.rb
  # Call with appname in page layouts like <%= appname %>
  # @returns [String]
  def appname
    @appname = Rails.application.appname
  end
end
