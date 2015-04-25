class AddIdToCarrera < ActiveRecord::Migration
  def change
  	add_column :carreras, :id_director, :int
  end
end
