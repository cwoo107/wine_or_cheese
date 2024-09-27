json.extract! response, :id, :message_id, :content, :created_at, :updated_at
json.url response_url(response, format: :json)
