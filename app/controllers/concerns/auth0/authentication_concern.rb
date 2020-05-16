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
      @current_user ||= CurrentUser.new(session[:userinfo])
    end

    # Current User is mainly used for authorization by Pundit
    class CurrentUser
      attr_accessor :uid, :credentials, :roles

      APPLICANT = 'Applicant'.freeze
      COORDINATOR = 'Coordinator'.freeze
      ADMINISTRATOR = 'Administrator'.freeze

      # @return [CurrentUser]
      def initialize(userinfo)
        @roles = []
        return if userinfo.nil?
        @uid = userinfo['uid']
        @roles = userinfo['roles']
      end

      # @return [Boolean]
      def is_admin?
        @roles.include? ADMINISTRATOR
      end

      # @return [Boolean]
      def is_coordinator?
        @roles.include? COORDINATOR
      end

      # @return [Boolean]
      def is_applicant?
        @roles.include? APPLICANT
      end

      # Equivalent to calling user_signed_in?
      # @return [Boolean]
      def is_unauthenticated?
        @uid.nil?
      end
    end
  end
end