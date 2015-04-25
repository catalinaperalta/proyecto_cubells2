json.array!(@parcials) do |parcial|
  json.extract! parcial, :id, :codpr, :numero, :calificacion, :matricula, :codma
  json.url parcial_url(parcial, format: :json)
end
