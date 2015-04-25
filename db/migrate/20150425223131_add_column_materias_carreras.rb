class AddColumnMateriasCarreras < ActiveRecord::Migration
  def change
  	add_column :materia_carreras, :semestre, :int
  end
end
