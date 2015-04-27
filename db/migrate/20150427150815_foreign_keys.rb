class ForeignKeys < ActiveRecord::Migration
  def change
  	add_foreign_key :actividads, :parcials, column: "id_parcial", primary_key: "id"
  	add_foreign_key :alumnos, :carreras, column: "id_carrera", primary_key: "id"
  	add_foreign_key :carreras, :directors, column: "id_director", primary_key: "id"
  	add_foreign_key :materia_alumnos, :cursos, column: "materia_id", primary_key: "id"
  	add_foreign_key :materia_alumnos, :alumnos, column: "alumno_id", primary_key: "id"
  	add_foreign_key :materia_carreras, :carreras, column: "carrera_id", primary_key: "id"
  	add_foreign_key :materia_carreras, :cursos, column: "materia_id", primary_key: "id"
  	add_foreign_key :materia_profesors, :profesors, column: "profesor_id", primary_key: "id"
  	add_foreign_key :materia_profesors, :cursos, column: "materia_id", primary_key: "id"
  	add_foreign_key :parcials, :materia_alumnos, column: "id_materia_alumno", primary_key: "id"

  end
end
