json.extract! user, :id, :name, :program, :created_at, :updated_at
json.url user_url(user, format: :json)
