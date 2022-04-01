# frozen_string_literal: true

require "active_support/concern"
module Rollbar
  # Module for managing authentication of Auth0 users for Rollbar
  module AuthenticationConcern
    extend ActiveSupport::Concern
    include ::Auth0::AuthenticationConcern

    included do
      helper_method :current_user_for_rollbar if respond_to?(:helper_method)
    end

    # @return [OpenStruct]
    def current_user_for_rollbar
      id = user_signed_in? ? current_user.uid : nil
      OpenStruct.new({ id: })
    end
  end
end
