# frozen_string_literal: true

class LogoutController < ApplicationController
  after_action :skip_authorization
  # include LogoutHelper
  def logout
    reset_session
    redirect_to(root_url)
  end
end
