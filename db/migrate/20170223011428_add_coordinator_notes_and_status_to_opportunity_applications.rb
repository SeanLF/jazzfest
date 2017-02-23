class AddCoordinatorNotesAndStatusToOpportunityApplications < ActiveRecord::Migration[5.0]
  def change
    add_column :opportunity_applications, :coordinator_notes, :text
    add_reference :opportunity_applications, :opportunity_application_status, foreign_key: true, index: { name: 'index_applications_on_application_status_id' }
  end
end
