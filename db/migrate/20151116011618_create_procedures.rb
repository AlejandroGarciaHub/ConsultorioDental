class CreateProcedures < ActiveRecord::Migration
  def change
    create_table :procedures do |t|
      t.references :appointment, index: true, foreign_key: true
      t.string :nombre
      t.string :tipo
      t.text :descripcion
      t.decimal :precio

      t.timestamps null: false
    end
  end
end
