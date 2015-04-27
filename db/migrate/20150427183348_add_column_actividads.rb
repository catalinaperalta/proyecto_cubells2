class AddColumnActividads < ActiveRecord::Migration
  def change
  	add_column :actividads, :calificacion, :int
  end
end
