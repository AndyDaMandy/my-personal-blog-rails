json.extract! medium, :id, :name, :thumbnail, :release_date, :category, :platform, :link, :thoughts, :date_started,
              :date_completed, :progress, :created_at, :updated_at
json.url medium_url(medium, format: :json)
json.thumbnail url_for(medium.thumbnail)
