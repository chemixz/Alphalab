json.array!(@images) do |image|
  json.extract! image, :id, :name, :url_img, :format, :proyect_id
  json.url image_url(image, format: :json)
end
