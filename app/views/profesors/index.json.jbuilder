json.array!(@profesors) do |profesor|
  json.extract! profesor, :id, :nomina, :nombre, :apellido, :password
  json.url profesor_url(profesor, format: :json)
end
