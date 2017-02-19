class DashboardController < ApplicationController
  before_action :store_opportunity_id_if_not_authorized_yet, only: [:show]
  before_action :authenticate_user!
  after_action :skip_authorization

  def show
    @profile = Profile.find_by(auth0_id: session[:userinfo]['uid'])
    @opportunity_application = OpportunityApplication.find_or_initialize_by(profile: @profile)
    @opportunity_application.choices = session[:volunteer_opportunity_id] if session[:volunteer_opportunity_id] and @opportunity_application.new_record?
    @opportunity_application.save(validate: false)
    @volunteer_opportunities = policy_scope(VolunteerOpportunity).order(:title)
  end

  def success
    profile = Profile.find_by(auth0_id: session[:userinfo]['uid'])
    redirect_to apply_path, notice: 'Opportunity application was successfully created.' unless OpportunityApplication.find_by(profile: profile).submitted

    @update = params['update'] == 'true' || false
  end

  private
  def store_opportunity_id_if_not_authorized_yet
    session[:volunteer_opportunity_id] = nil
    session[:volunteer_opportunity_id] = [params['volunteer_opportunity_id']].to_json if params['volunteer_opportunity_id'].present?
  end
end
