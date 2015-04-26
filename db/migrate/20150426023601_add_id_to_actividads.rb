class AddIdToActividads < ActiveRecord::Migration
  def change
    add_column :actividads, :id, :primary_key
  end
end
