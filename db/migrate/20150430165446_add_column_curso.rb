class AddColumnCurso < ActiveRecord::Migration
  def change
  	add_column :cursos, :profesor, :int
  end
end
