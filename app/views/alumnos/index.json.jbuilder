json.array!(@alumnos) do |alumno|
  json.extract! alumno, :id
  json.url alumno_url(alumno, format: :json)
end
