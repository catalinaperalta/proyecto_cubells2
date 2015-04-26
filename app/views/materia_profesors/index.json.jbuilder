json.array!(@materia_profesors) do |materia_profesor|
  json.extract! materia_profesor, :id, :materia_id, :profesor_id
  json.url materia_profesor_url(materia_profesor, format: :json)
end
