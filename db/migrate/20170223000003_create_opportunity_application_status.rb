class CreateOpportunityApplicationStatus < ActiveRecord::Migration[5.0]
  def change
    create_table :opportunity_application_status do |t|
      t.string :name

      t.timestamps
    end
  end
end
