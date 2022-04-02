# frozen_string_literal: true

class CreateVolunteerOpportunities < ActiveRecord::Migration[6.1]
  def change
    create_table(:volunteer_opportunities) do |t|
      t.text(:title)
      t.text(:objective)
      t.text(:duties_and_responsibilities)
      t.text(:qualifications_and_requirements)
      t.text(:shifts)
      t.boolean(:visible)

      t.timestamps
    end
  end
end
