class CreateRegions < ActiveRecord::Migration[5.0]
  def change
    create_table :regiones do |t|
      t.string :nombre
      t.string :corfo
      t.string :codigo
      t.integer :numero

      t.timestamps
    end
  end
end
