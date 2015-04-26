class AddIdToAlumnos < ActiveRecord::Migration
  def change
    add_column :alumnos, :id, :primary_key
  end
end
