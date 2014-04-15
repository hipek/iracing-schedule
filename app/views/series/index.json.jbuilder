json.array!(@series) do |series|
  json.extract! series, :id, :name, :season_id
  json.url series_url(series, format: :json)
end
