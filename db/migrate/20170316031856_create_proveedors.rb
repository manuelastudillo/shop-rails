class CreateProveedors < ActiveRecord::Migration[5.0]
  def change
    create_table :proveedors do |t|
      t.string :name
      t.string :rut
      t.integer :fono
      t.integer :email
      t.references :comuna, foreign_key: true
      t.string   :slug
      t.timestamps
    end
  end
end
