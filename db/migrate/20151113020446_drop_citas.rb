class DropCitas < ActiveRecord::Migration
  def change
  	drop_table :cita
  end
end
