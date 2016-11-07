json.array!(@categories) do |category|
  json.extract! category, :id, :name, :color , :proyects
  json.url category_url(category, format: :json)
end
