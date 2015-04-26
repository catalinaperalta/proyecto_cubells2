class AddIdToCarreras < ActiveRecord::Migration
  def change
    add_column :carreras, :id, :primary_key
  end
end
