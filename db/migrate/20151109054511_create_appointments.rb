class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :Motivo
      t.datetime :Fecha
      t.text :Anotaciones

      t.timestamps null: false
    end
  end
end
