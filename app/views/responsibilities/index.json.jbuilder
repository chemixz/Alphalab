json.array!(@responsibilities) do |responsibility|
  json.extract! responsibility, :id, :responsible_id, :proyect_id
  json.url responsibility_url(responsibility, format: :json)
end
