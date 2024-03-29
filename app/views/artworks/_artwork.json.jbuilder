json.extract! artwork, :id, :title, :description, :image, :user_id, :created_at, :updated_at
json.url artwork_url(artwork, format: :json)
json.image url_for(artwork.image)
