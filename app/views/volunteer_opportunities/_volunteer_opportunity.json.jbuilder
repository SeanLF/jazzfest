# frozen_string_literal: true

json.extract!(volunteer_opportunity, :id, :title, :objective, :duties_and_responsibilities, :qualifications_and_requirements, :shifts, :visibility, :created_at, :updated_at)
json.url(volunteer_opportunity_url(volunteer_opportunity, format: :json))
