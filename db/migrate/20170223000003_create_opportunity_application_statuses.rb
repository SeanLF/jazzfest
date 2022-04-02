# frozen_string_literal: true

class CreateOpportunityApplicationStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table(:opportunity_application_statuses) do |t|
      t.string(:name)

      t.timestamps
    end
  end
end
