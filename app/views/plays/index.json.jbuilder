json.array!(@plays) do |play|
  json.extract! play, :track_id, :album_id, :user_id, :played_at
  json.url play_url(play, format: :json)
end