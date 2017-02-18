class DashboardController < ApplicationController
  before_action :authenticate_user!
  after_action :skip_authorization

  def show
    @profile = Profile.find_by(auth0_id: session[:userinfo]['uid'])
    @opportunity_application = OpportunityApplication.find_or_create_by(profile: @profile)
    @volunteer_opportunities = VolunteerOpportunity.all.order(:title)
  end

  def success
    profile = Profile.find_by(auth0_id: session[:userinfo]['uid'])
    redirect_to apply_path, notice: 'Opportunity application was successfully created.' unless OpportunityApplication.find_by(profile: profile).submitted

    @update = params['update'] == 'true' || false
  end
end
