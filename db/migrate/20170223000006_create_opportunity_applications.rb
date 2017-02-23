class CreateOpportunityApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :opportunity_applications do |t|
      t.references :profile, foreign_key: true
      t.text :availability
      t.string :choices
      t.boolean :submitted
      t.references :opportunity_application_status, index: { name: 'index_applications_on_application_status_id' }, foreign_key: { to_table: :opportunity_application_statuses }
      t.text :coordinator_notes
      t.references :accepted_volunteer_opportunity, index: { name: 'index_applications_on_accepted_opportunity_id' }, foreign_key: { to_table: :volunteer_opportunities }

      t.timestamps
    end
  end
end
