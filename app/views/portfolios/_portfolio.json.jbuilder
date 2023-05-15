json.extract! portfolio, :id, :name, :poster, :language, :framework, :about, :user_id, :created_at, :updated_at
json.url portfolio_url(portfolio, format: :json)
json.poster url_for(portfolio.poster)
