class DropNombreProcedure < ActiveRecord::Migration
  def change
  	remove_column :procedures, :nombre
  end
end
