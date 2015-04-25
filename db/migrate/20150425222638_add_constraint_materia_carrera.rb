class AddConstraintMateriaCarrera < ActiveRecord::Migration
  def change
  	create_table :materia_carreras do |t|
  		t.belongs_to :materia, index: true
  		t.belongs_to :carrera, index: true

  		t.timestamps
  	end
  end
end
