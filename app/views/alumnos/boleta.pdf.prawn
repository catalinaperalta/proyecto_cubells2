pdf.text "Alumno: #{@alumno.matricula}"

@semestre.each do |s|
pdf.text "Semestre: #{s.numero}:"
@materia.each do |m|
if m.numero == s.numero
pdf.text "#{m.materia}"
@parcial.each do |p|
if p.materia == m.ma_id
pdf.text "Parcial #{p.numero}. Calificacion: #{p.calificacion}"
end 
end
end
end
end