json.extract! opportunity_application, :id, :profile_id, :availability, :choices, :submitted, :created_at, :updated_at
json.url opportunity_application_url(opportunity_application, format: :json)