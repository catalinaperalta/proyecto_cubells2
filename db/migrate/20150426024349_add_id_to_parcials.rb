class AddIdToParcials < ActiveRecord::Migration
  def change
    add_column :parcials, :id, :primary_key
  end
end
