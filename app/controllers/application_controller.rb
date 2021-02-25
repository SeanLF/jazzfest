# frozen_string_literal: true

# Application controller, which all controllers inherit
# This class will include common functionality
class ApplicationController < ActionController::Base
  include ::Auth0::AuthenticationConcern
  include Pundit

  add_flash_types :global_alert, :global_notice
  around_action :switch_locale
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # Redirects to the same page, if possible, with the other locale
  # Assumes the app will only be in english or french
  def change_language
    # detect path from referer, or use root
    path = Rails.application.routes.recognize_path(URI(request.referer || root_path).path)
    # ignore the locale detected from request referer, else can cause bugs
    path.delete(:locale)

    # flip the locale
    locale = I18n.available_locales.without(I18n.locale).first

    # redirect
    action = proc { redirect_to path }
    I18n.with_locale(locale, &action)
  end

  # Changes the locale between English and French
  def switch_locale(&action)
    I18n.with_locale(localized(parse_locale), &action)
  end

  # Redirects the user to the root path with a warning
  def user_not_authorized
    error_message = current_user.unauthenticated? ? t('error.unauthenticated') : t('error.unauthorized')
    redirect_back(fallback_location: root_path, global_alert: error_message)
  end

  private

  def parse_locale
    locale = params[:locale] || extract_locale_from_accept_language_header
    locale.to_sym
  end

  def extract_locale_from_accept_language_header
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
  end

  def localized(locale = I18n.locale)
    locale == I18n.default_locale ? nil : locale
  end

  def default_url_options(_options = {})
    { locale: localized }
  end
end
