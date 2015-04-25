class DropImpartes < ActiveRecord::Migration
  def change
  	drop_table :impartes
  end
end
