class DropColumnToDirectors < ActiveRecord::Migration
  def change
  	remove_column :directors, :coddr
  end
end
