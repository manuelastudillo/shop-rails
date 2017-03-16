class AddApellidoToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :apellido, :string
  end
end
