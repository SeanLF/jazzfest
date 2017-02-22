json.extract! event, :id, :name, :start_date, :end_date, :registration_start_date, :registration_end_date, :active, :created_at, :updated_at
json.url event_url(event, format: :json)