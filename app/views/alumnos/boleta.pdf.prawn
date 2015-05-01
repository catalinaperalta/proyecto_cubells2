pdf.text "Alumno: #{@alumno.matricula}"

@semestre.each do |s|
pdf.text "Semestre #{s.numero}:"
@materia.each do |m|
if m.numero == s.numero
@avg.each do |p|
pdf.text "#{m.materia}: #{p[m.ma_id]}"
end
end
end
end