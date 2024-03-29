# frozen_string_literal: true

json.extract!(profile, :id, :auth0_id, :email, :first_name, :last_name, :address, :city, :province, :postal_code, :home_phone_number, :cell_phone_number, :work_phone_number, :t_shirt_size, :age_group, :emergency_contact_name, :emergency_contact_number, :notes, :code_of_conduct, :created_at, :updated_at)
json.url(profile_url(profile, format: :json))
