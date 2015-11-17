class FixColumnName < ActiveRecord::Migration
  def change
    change_table :patients do |t|
      t.rename :Nombre, :nombre
      t.rename :APaterno, :aPaterno
      t.rename :AMaterno, :aMaterno
      t.rename :FechaNac, :fechaNac
      t.rename :Sexo, :sexo
      t.rename :DomicilioCalle, :domicilioCalle
      t.rename :DomicilioCiudad, :domicilioCiudad
      t.rename :Telefono, :telefono
      t.rename :BajoTMedico, :bajoTMedico
      t.rename :TomaActualMedicamento, :tomaActualMedicamento
      t.rename :MedicamentoTomado, :medicamentoTomado
      t.rename :SangraExcesivo, :sangraExcesivo
      t.rename :EsVIH, :esVIH
      t.rename :EstaEmbarazada, :estaEmbarazada
      t.rename :EsAlergico, :esAlergico
      t.rename :MedicamentoAlergia, :medicamentoAlergia
      t.rename :TipoSangre, :tipoSangre
    end
  end
end
