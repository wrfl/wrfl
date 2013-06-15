json.array!(@albums) do |album|
  json.extract! album, :name, :label, :compilation
  json.url album_url(album, format: :json)
end