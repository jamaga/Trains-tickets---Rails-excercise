json.array!(@cities) do |city|
  json.extract! city, :id, :name, :short_name, :population
  json.url city_url(city, format: :json)
end
