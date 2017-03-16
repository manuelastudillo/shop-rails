class CreateClientes < ActiveRecord::Migration[5.0]
  def change
    create_table :clientes do |t|
      t.string :name
      t.string :last_name
      t.string :rut
      t.integer :fono
      t.integer :email
      t.references :comuna, foreign_key: true
      t.string   :slug
      t.timestamps
    end
  end
end
