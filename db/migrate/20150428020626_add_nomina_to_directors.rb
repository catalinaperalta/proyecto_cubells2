class AddNominaToDirectors < ActiveRecord::Migration
  def change
    add_column :directors, :nomina, :string
  end
end
