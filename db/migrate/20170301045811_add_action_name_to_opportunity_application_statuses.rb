class AddActionNameToOpportunityApplicationStatuses < ActiveRecord::Migration[4.2]
  def change
    add_column :opportunity_application_statuses, :action_name, :string
    add_column :opportunity_application_statuses, :action_color, :string
  end
end
