class AddIdToDirectors < ActiveRecord::Migration
  def change
    add_column :directors, :id, :primary_key
  end
end
