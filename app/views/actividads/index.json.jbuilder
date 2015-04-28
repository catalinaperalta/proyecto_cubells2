json.array!(@actividads) do |actividad|
  json.extract! actividad, :id, :nombre, :descripcion, :ponderacion, :id_parcial, :calificacion
  json.url actividad_url(actividad, format: :json)
end
