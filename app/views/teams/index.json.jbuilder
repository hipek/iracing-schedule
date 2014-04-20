json.array!(@teams) do |team|
  json.extract! team, :id, :name, :slug
  json.url team_url(team, format: :json)
end
