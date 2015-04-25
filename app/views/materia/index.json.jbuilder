json.array!(@materia) do |materium|
  json.extract! materium, :id, :codma, :nombre, :horas_semanales, :requerimiento
  json.url materium_url(materium, format: :json)
end
