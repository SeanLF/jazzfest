class AddAcceptedVolunteerOpportunityToOpportunityApplications < ActiveRecord::Migration[5.0]
  def change
    add_reference :opportunity_applications, :accepted_volunteer_opportunity, foreign_key: {to_table: :opportunity_applications}, index: { name: 'index_applications_on_accepted_opportunity_id' }
  end
end
