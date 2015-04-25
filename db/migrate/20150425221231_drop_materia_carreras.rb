class DropMateriaCarreras < ActiveRecord::Migration
  def change
  	drop_table :materia_carreras
  end
end
