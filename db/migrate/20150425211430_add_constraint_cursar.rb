class AddConstraintCursar < ActiveRecord::Migration
  def change
  	create_table :materia_alumnos do |t|
  		t.belongs_to :materia, index: true
  		t.belongs_to :alumno, index: true

  		t.timestamps
  	end
  end
end
