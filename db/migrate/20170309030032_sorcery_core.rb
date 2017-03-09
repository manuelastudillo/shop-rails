class SorceryCore < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email,            :null => false
      t.string :crypted_password
      t.string :salt

      t.string   :nombre
      t.string   :calle
      t.integer  :telefono
      t.integer  :telefono1
      t.integer  :rol_id
      t.integer  :comuna_id
      t.datetime :fechaingreso
      t.integer  :sueldo
      t.string   :rut
      t.string   :slug

      t.timestamps                :null => false
    end

    add_index :users, :email, unique: true
  end
end
