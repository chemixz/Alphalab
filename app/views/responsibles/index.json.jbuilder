json.array!(@responsibles) do |responsible|
  json.extract! responsible, :id, :first_name, :last_name, :email, :address
  json.url responsible_url(responsible, format: :json)
end
