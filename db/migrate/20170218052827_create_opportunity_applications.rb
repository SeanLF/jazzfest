class CreateOpportunityApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :opportunity_applications do |t|
      t.references :profile, foreign_key: true
      t.text :availability
      t.string :choices
      t.boolean :submitted

      t.timestamps
    end
  end
end
