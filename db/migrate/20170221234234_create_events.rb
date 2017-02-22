class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.date :registration_start_date
      t.date :registration_end_date
      t.boolean :active

      t.timestamps
    end
  end
end
