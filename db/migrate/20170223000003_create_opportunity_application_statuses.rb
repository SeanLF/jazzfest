class CreateOpportunityApplicationStatuses < ActiveRecord::Migration[4.2]
  def change
    create_table :opportunity_application_statuses do |t|
      t.string :name

      t.timestamps
    end
  end
end
