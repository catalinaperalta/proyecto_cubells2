class RenameOldTableToNewTable < ActiveRecord::Migration
  def change
  	rename_table :materias, :cursos
  end
end
