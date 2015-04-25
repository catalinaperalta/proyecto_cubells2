json.array!(@actividads) do |actividad|
  json.extract! actividad, :id, :codac, :nombre, :descripcion, :ponderacion, :codpr
  json.url actividad_url(actividad, format: :json)
end
