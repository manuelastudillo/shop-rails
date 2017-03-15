class CreateClientes < ActiveRecord::Migration[5.0]
  def change
    create_table :clientes do |t|
      t.text :nombre
      t.string :rut
      t.text :domicilio
      t.integer :telefono1
      t.string :mail
      t.text :descripcion
      t.references :comuna, foreign_key: true
      t.string :slug
      t.timestamps
    end
  end
end
