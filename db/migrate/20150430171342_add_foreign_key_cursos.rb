class AddForeignKeyCursos < ActiveRecord::Migration
  def change
  	add_foreign_key :cursos, :profesors, column: "profesor", primary_key: "id"
  end
end
