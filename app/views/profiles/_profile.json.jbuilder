json.extract! profile, :id, :customer_id, :default_avatar_id, :weight_kg, :bio, :tagline, :created_at, :updated_at
json.url profile_url(profile, format: :json)