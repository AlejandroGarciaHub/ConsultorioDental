class FixColumnAppointment < ActiveRecord::Migration
  def change
	change_table :appointments do |t|
      t.rename :Motivo, :motivo
      t.rename :Fecha, :fecha
      t.rename :Anotaciones, :anotaciones
	  end
  end
end
