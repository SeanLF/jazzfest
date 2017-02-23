if policy(OpportunityApplication).accept?
  json.extract! opportunity_application, :id, :profile_id, :availability, :choices, :opportunity_application_status, :coordinator_notes, :submitted, :created_at, :updated_at
else
  json.extract! opportunity_application, :id, :profile_id, :availability, :choices, :submitted, :created_at, :updated_at
end
json.url opportunity_application_url(opportunity_application, format: :json)
