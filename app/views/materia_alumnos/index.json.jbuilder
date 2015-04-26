json.array!(@materia_alumnos) do |materia_alumno|
  json.extract! materia_alumno, :id, :materia_id, :alumno_id, :fecha
  json.url materia_alumno_url(materia_alumno, format: :json)
end
