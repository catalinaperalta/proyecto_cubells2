class AddIdToMaterias < ActiveRecord::Migration
  def change
    add_column :materias, :id, :primary_key
  end
end
