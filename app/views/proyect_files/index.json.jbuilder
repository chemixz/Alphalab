json.array!(@proyect_files) do |proyect_file|
  json.extract! proyect_file, :id, :name, :url_img, :format_img, :proyect_id
  json.url proyect_file_url(proyect_file, format: :json)
end
