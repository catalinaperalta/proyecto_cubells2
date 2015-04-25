class AddIdToActividad < ActiveRecord::Migration
  def change
  	add_column :actividads, :id_parcial, :int
  end
end
