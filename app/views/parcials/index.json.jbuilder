json.array!(@parcials) do |parcial|
  json.extract! parcial, :id, :numero, :calificacion, :id_materia_alumno
  json.url parcial_url(parcial, format: :json)
end
