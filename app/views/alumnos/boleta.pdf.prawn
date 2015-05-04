pdf.text "Alumno: #{@alumno.matricula}"

@semestre.each do |s|
pdf.text "Semestre #{s.numero}:"
@materia.each do |m|
if m.numero == s.numero
@avg = Parcial.joins("JOIN materia_alumnos ON materia_alumnos.id = parcials.id_materia_alumno").where("materia_alumnos.id = ?", m.ma_id).average(:calificacion)
pdf.text "#{m.materia}: #{@avg}"
end
end
@total = Parcial.joins("JOIN materia_alumnos ON materia_alumnos.id = parcials.id_materia_alumno JOIN materia_carreras ON materia_carreras.materia_id = materia_alumnos.materia_id").where("materia_alumnos.alumno_id = ? AND materia_carreras.semestre = ?", params[:id], s.numero).average(:calificacion)
pdf.text "Total: #{@total}"
end