class ReportController < ApplicationController
  before_action :authenticate_user!

  def export_opportunity_applications
    authorize :report

    accepted_status_id = OpportunityApplicationStatus.accepted.id
    @opportunity_applications = policy_scope(OpportunityApplication).submitted.where(opportunity_application_status_id: accepted_status_id).eager_load(:profile, :opportunity_application_status).order(:updated_at)
    @volunteer_opportunities = VolunteerOpportunity.select(:id, :title).index_by(&:id)

    respond_to do |format|
      format.xlsx { response.headers['Content-Disposition'] = 'attachment; filename="Volunteer Applications.xlsx"' }
    end
  end

  def export_opportunity_application_coordinator_comments
    authorize :report

    @opportunity_applications = policy_scope(OpportunityApplication).where.not(coordinator_notes: [nil, '']).submitted.eager_load(:profile, :opportunity_application_status)
    @volunteer_opportunities = VolunteerOpportunity.select(:id, :title).index_by(&:id)

    respond_to do |format|
      format.xlsx { response.headers['Content-Disposition'] = 'attachment; filename="Volunteer application coordinator comments.xlsx"' }
    end
  end
end
