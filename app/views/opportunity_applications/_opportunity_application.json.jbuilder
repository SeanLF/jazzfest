if at_least_coordinator?
  json.extract! opportunity_application, :id, :profile_id, :availability, :choices, :opportunity_application_status, :submitted, :coordinator_notes, :accepted_volunteer_opportunity_id, :created_at, :updated_at
else
  json.extract! opportunity_application, :id, :profile_id, :availability, :choices, :opportunity_application_status, :submitted, :created_at, :updated_at
end
json.url opportunity_application_url(opportunity_application, format: :json)
