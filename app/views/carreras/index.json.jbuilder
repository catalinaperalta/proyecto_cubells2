json.array!(@carreras) do |carrera|
  json.extract! carrera, :id, :nombre, :siglas, :id_director
  json.url carrera_url(carrera, format: :json)
end
