require "active_support/concern"
module Auth0
  module AuthenticationConcern
    extend ActiveSupport::Concern

    included do
      if respond_to?(:helper_method)
        helper_method :user_signed_in?, :authenticate_user!, :current_user
      end
    end

    # Checks if a user is signed in
    # @return [Boolean]
    def user_signed_in?
      session[:userinfo].present?
    end

    # Set the @current_user or redirect to public page
    def authenticate_user!
      # Redirect to page that has the login here
      if user_signed_in?
        current_user
      else
        redirect_to login_path
      end
    end

    # Gets the current user
    # @return [OpenStruct]
    def current_user
      @current_user ||= OpenStruct.new(session[:userinfo])
    end
  end
end