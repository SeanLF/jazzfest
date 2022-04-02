# frozen_string_literal: true

class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table(:profiles) do |t|
      t.text(:auth0_id)
      t.text(:email)
      t.text(:first_name)
      t.text(:last_name)
      t.text(:address)
      t.text(:city)
      t.text(:province)
      t.text(:postal_code)
      t.text(:home_phone_number)
      t.text(:cell_phone_number)
      t.text(:work_phone_number)
      t.text(:t_shirt_size)
      t.text(:age_group)
      t.text(:emergency_contact_name)
      t.text(:emergency_contact_number)
      t.text(:notes)
      t.boolean(:code_of_conduct)

      t.timestamps
    end
  end
end
