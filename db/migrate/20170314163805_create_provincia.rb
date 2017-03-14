class CreateProvincia < ActiveRecord::Migration[5.0]
  def change
    create_table :provincias do |t|
      t.string :nombre
      t.references :regiones, foreign_key: true

      t.timestamps
    end
  end
end
