json.extract! hotel_stay, :id, :hotel_id, :user_id, :created_at, :updated_at
json.url hotel_stay_url(hotel_stay, format: :json)
