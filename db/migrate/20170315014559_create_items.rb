class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :codigo
      t.string :descripcion
      t.references :brand, foreign_key: true
      t.references :unit, foreign_key: true
      t.references :category, foreign_key: true
      t.integer :stock
      t.integer :min_stock
      t.integer :precio
      t.references :proveedor, foreign_key: true
      t.string :slug
      t.timestamps
    end
  end
end
