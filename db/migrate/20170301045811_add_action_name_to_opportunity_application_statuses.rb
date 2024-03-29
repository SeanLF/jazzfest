# frozen_string_literal: true

class AddActionNameToOpportunityApplicationStatuses < ActiveRecord::Migration[6.1]
  def change
    add_column(:opportunity_application_statuses, :action_name, :string)
    add_column(:opportunity_application_statuses, :action_color, :string)
  end
end
