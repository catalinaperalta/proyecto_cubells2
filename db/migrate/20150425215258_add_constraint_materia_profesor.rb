class AddConstraintMateriaProfesor < ActiveRecord::Migration
  def change
  	create_table :materia_profesors do |t|
  		t.belongs_to :materia, index: true
  		t.belongs_to :profesor, index: true

  		t.timestamps
  	end
  end
end
