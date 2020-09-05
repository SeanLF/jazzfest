# frozen_string_literal: true

require 'active_support/concern'
module Auth0
  # Module for managing authentication of Auth0 users
  module AuthenticationConcern
    extend ActiveSupport::Concern

    included do
      helper_method :user_signed_in?, :authenticate_user!, :current_user if respond_to?(:helper_method)
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
        redirect_to(login_path)
      end
    end

    # Gets the current user
    # @return [CurrentUser]
    def current_user
      @current_user ||= CurrentUser.new(session[:userinfo])
    end

    # Current User is mainly used for authorization by Pundit
    class CurrentUser
      attr_accessor :uid, :roles

      APPLICANT = 'Applicant'
      COORDINATOR = 'Coordinator'
      ADMINISTRATOR = 'Administrator'

      # @return [CurrentUser]
      def initialize(userinfo)
        @roles = []
        return if userinfo.nil?

        @uid = userinfo['uid']
        @roles = userinfo['roles']
      end

      # @return [Boolean]
      def admin?
        @roles.include?(ADMINISTRATOR)
      end

      # @return [Boolean]
      def coordinator?
        @roles.include?(COORDINATOR)
      end

      # @return [Boolean]
      def applicant?
        @roles.include?(APPLICANT)
      end

      # Equivalent to calling user_signed_in?
      # @return [Boolean]
      def unauthenticated?
        @uid.nil?
      end
    end
  end
end
