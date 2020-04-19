require 'authentication'
class ApplicationController < ActionController::Base
  include ::Authentication

  around_action :switch_locale

  def change_language
    path = Rails.application.routes.recognize_path root_path
    if request.referer.nil?
      path[:locale] = parse_locale
    else
        path = Rails.application.routes.recognize_path URI(request.referer).path
    end
    path[:locale] = path[:locale] == 'fr' ? 'en' : 'fr'
    redirect_to path
  end

  def switch_locale(&action)
    logger.debug "* Accept-Language: #{request.env['HTTP_ACCEPT_LANGUAGE']}"
    parsed_locale = parse_locale
    parsed_locale ||= current_user.try(:locale)
    locale = I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : default_url_options
    logger.debug "* Locale set to '#{locale}'"
    I18n.with_locale(locale, &action)
  end

  private
  def parse_locale
    params[:locale] || extract_locale_from_accept_language_header
  end

  def extract_locale_from_accept_language_header
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
