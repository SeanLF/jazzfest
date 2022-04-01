# frozen_string_literal: true

json.extract!(setting, :id, :name, :value_type, :value, :created_at, :updated_at)
json.url(setting_url(setting, format: :json))
