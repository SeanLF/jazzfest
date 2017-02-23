class DashboardController < ApplicationController
  before_action :store_opportunity_id_if_not_authorized_yet, only: [:apply]
  before_action :authenticate_user!

  def apply
    authorize :dashboard
    @profile = Profile.find_by(auth0_id: session[:userinfo]['uid'])
    authorize @profile, :update?
    @opportunity_application = OpportunityApplication.find_or_initialize_by(profile: @profile)
    @opportunity_application.choices = session[:volunteer_opportunity_id] if session[:volunteer_opportunity_id] && (@opportunity_application.choices.nil? || @opportunity_application.choices.empty?)
    @opportunity_application.opportunity_application_status_id = OpportunityApplicationStatus.pending.id if @opportunity_application.new_record?
    @opportunity_application.save(validate: false)
    authorize @opportunity_application, :update?
    @volunteer_opportunities = policy_scope(VolunteerOpportunity).order(:title)
    authorize @volunteer_opportunities, :index?
  end

  def success
    authorize :dashboard
    profile = Profile.find_by(auth0_id: session[:userinfo]['uid'])
    redirect_to apply_path, notice: 'Opportunity application was successfully created.' unless OpportunityApplication.find_by(profile: profile).submitted

    @update = params['update'] == 'true' || false
  end

  def elevated_user_dashboard
    authorize :dashboard
  end

  private

  def store_opportunity_id_if_not_authorized_yet
    session[:volunteer_opportunity_id] = nil
    session[:volunteer_opportunity_id] = [params['volunteer_opportunity_id']].to_json if params['volunteer_opportunity_id'].present?
  end
end
