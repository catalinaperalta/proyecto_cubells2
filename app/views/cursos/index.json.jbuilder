json.array!(@cursos) do |curso|
  json.extract! curso, :id, :codma, :nombre, :horas_semanales, :requerimiento
  json.url curso_url(curso, format: :json)
end
