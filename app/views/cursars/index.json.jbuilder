json.array!(@cursars) do |cursar|
  json.extract! cursar, :id, :matricula, :codma, :fecha
  json.url cursar_url(cursar, format: :json)
end
