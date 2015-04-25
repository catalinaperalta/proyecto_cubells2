class AddColumnMateriaAlumnos < ActiveRecord::Migration
  def change
  	add_column :materia_alumnos, :fecha, :date
  end
end
