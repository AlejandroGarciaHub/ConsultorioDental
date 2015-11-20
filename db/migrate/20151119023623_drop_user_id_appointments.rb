class DropUserIdAppointments < ActiveRecord::Migration
  def change
  	remove_column :appointments, :user_id
  end
end
