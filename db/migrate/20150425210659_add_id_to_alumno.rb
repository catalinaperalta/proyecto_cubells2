class AddIdToAlumno < ActiveRecord::Migration
  def change
  	add_column :alumnos, :id_carrera, :int
  end
end
