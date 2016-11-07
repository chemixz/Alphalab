json.array!(@proyects) do |proyect|
  json.extract! proyect, :id, :title, :body, :start_date, :finish_date, :state, :cover , :user_id , :categories ,:user
  json.url proyect_url(proyect, format: :json)
end
