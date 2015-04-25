json.array!(@directors) do |director|
  json.extract! director, :id, :coddr, :nombre, :password
  json.url director_url(director, format: :json)
end
