json.extract! message, :id, :adventure_id, :message, :created_at, :updated_at
json.url message_url(message, format: :json)
