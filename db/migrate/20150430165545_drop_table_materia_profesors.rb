class DropTableMateriaProfesors < ActiveRecord::Migration
  def change
  	drop_table :materia_profesors, force: :cascade
  end
end
