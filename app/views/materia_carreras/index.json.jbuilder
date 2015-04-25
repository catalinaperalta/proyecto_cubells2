json.array!(@materia_carreras) do |materia_carrera|
  json.extract! materia_carrera, :id, :codma, :codca, :semestre
  json.url materia_carrera_url(materia_carrera, format: :json)
end
