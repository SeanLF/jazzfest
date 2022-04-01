# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Auth0Helper
  include Pundit

  before_action :user_signed_in?
  before_action :set_paper_trail_whodunnit
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def user_not_authorized
    Rollbar.warning("Tried to access unauthorized resource")
    redirect_back(fallback_location: :root_path, notice: "Please don't try to do things you aren't supposed to")
  end

  def user_for_paper_trail
    user_signed_in? ? current_user["uid"] : "Public user"
  end
end
