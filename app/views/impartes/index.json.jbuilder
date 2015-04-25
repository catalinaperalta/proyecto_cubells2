json.array!(@impartes) do |imparte|
  json.extract! imparte, :id, :codma, :nomina
  json.url imparte_url(imparte, format: :json)
end
