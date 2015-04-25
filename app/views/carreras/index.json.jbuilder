json.array!(@carreras) do |carrera|
  json.extract! carrera, :id, :codca, :nombre, :siglas, :coddr
  json.url carrera_url(carrera, format: :json)
end
