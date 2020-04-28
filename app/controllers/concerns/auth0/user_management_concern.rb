require "active_support/concern"
module Auth0
  module UserManagementConcern
    extend ActiveSupport::Concern

    included do
      if respond_to?(:helper_method)
        helper_method :delete_auth0_user
      end
    end

    # Uses the auth0 management API to delete the user
    def delete_auth0_user(auth0_user_id)
      auth0_client.delete_user(auth0_user_id)
    end

    private
    # Setup the Auth0 API connection.
    def auth0_client
      @auth0_client ||= Auth0Client.new(
        client_id: Rails.application.credentials[:auth0][:client_id],
        client_secret: Rails.application.credentials[:auth0][:client_secret],
        # If you pass in a client_secret value, the SDK will automatically try to get a 
        # Management API token for this application. Make sure your Application can make a 
        # Client Credentials grant (Application settings in Auth0 > Advanced > Grant Types
        # tab) and that the Application is authorized for the Management API:
        # https://auth0.com/docs/api-auth/config/using-the-auth0-dashboard
        #
        # Otherwise, you can pass in a Management API token directly for testing or temporary
        # access using the key below. 
        # token: ENV['AUTH0_RUBY_API_TOKEN'],
        domain: Rails.application.credentials[:auth0][:domain],
        api_version: 2
      )
    end
  end
end