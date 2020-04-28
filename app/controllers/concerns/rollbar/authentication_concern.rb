require "active_support/concern"
module Rollbar
  module AuthenticationConcern
    extend ActiveSupport::Concern
    include ::Auth0::AuthenticationConcern
  
    included do
      if respond_to?(:helper_method)
        helper_method :current_user_for_rollbar
      end
    end
  
    # @return [OpenStruct]
    def current_user_for_rollbar
      id = user_signed_in? ? current_user.uid : nil
      OpenStruct.new({id: id})
    end
  end
end