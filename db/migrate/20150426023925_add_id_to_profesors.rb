class AddIdToProfesors < ActiveRecord::Migration
  def change
    add_column :profesors, :id, :primary_key
  end
end
