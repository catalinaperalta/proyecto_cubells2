class AddIdToParcial < ActiveRecord::Migration
  def change
  	add_column :parcials, :id_materia_alumno, :int
  end
end
