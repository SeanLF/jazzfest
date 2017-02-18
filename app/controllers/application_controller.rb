class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Auth0Helper
  include Pundit

  before_action :user_signed_in?
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def user_not_authorized
    redirect_to :back, notice: 'Please don\'t try to do things you aren\'t supposed to'
  end
end
