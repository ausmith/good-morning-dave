json.array!(@preferences) do |preference|
  json.extract! preference, :id, :plugin, :name, :value
  json.url preference_url(preference, format: :json)
end
