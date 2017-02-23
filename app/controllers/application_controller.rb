class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Auth0Helper
  include Pundit

  before_action :user_signed_in?
  before_action :set_paper_trail_whodunnit
  before_action do
    @active_event = policy_scope(Event).active
    @min_dates = Setting.min_dates.real_value
    @min_num_choices = Setting.min_num_choices.real_value
    @max_num_choices = Setting.max_num_choices.real_value
  end
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def user_not_authorized
    Rollbar.warning('Tried to access unauthorized resource')
    redirect_to :back, notice: 'Please don\'t try to do things you aren\'t supposed to'
  end

  def user_for_paper_trail
    logged_in? ? current_user_profile.id : 'Public user'
  end
end
