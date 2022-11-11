json.extract! tweet, :id, :title, :content, :published, :created_at, :updated_at
json.url tweet_url(tweet, format: :json)
