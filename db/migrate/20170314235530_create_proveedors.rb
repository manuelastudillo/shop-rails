class CreateProveedors < ActiveRecord::Migration[5.0]
  def change
    create_table :proveedors do |t|
      t.string :nombre
      t.string :razon_social
      t.string :rut
      t.string :domicilio
      t.integer :telefono1
      t.integer :telefono2
      t.integer :web
      t.integer :mail
      t.string :descripcion
      t.references :comuna, foreign_key: true
      t.string :slug
      t.timestamps
    end
  end
end
