class CreateCursos < ActiveRecord::Migration
  def change
    create_table :cursos do |t|

      t.timestamps null: false
    end
  end
end
