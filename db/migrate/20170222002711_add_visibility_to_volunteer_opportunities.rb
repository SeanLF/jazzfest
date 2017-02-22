class AddVisibilityToVolunteerOpportunities < ActiveRecord::Migration[5.0]
  def change
    add_column :volunteer_opportunities, :visible, :boolean
  end
end
