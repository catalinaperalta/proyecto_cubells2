json.array!(@alumnos) do |alumno|
  json.extract! alumno, :id, :matricula, :nombre, :apellido_p, :apellido_m, :edad, :fecha_ingreso, :password, :id_carrera
  json.url alumno_url(alumno, format: :json)
end
