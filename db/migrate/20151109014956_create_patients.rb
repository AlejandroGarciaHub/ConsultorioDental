class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :Nombre
      t.string :APaterno
      t.string :AMaterno
      t.date :FechaNac
      t.boolean :Sexo
      t.string :DomicilioCalle
      t.string :DomicilioCiudad
      t.string :Telefono
      t.boolean :BajoTMedico
      t.boolean :TomaActualMedicamento
      t.string :MedicamentoTomado
      t.boolean :SangraExcesivo
      t.boolean :EsVIH
      t.boolean :EstaEmbarazada
      t.boolean :EsAlergico
      t.string :MedicamentoAlergia
      t.string :TipoSangre

      t.timestamps null: false
    end
  end
end
