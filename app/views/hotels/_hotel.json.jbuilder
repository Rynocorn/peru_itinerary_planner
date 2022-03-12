json.extract! hotel, :id, :name, :city_id, :user_id, :created_at, :updated_at
json.url hotel_url(hotel, format: :json)
