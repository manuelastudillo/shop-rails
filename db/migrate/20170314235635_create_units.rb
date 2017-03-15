class CreateUnits < ActiveRecord::Migration[5.0]
  def change
    create_table :units do |t|
      t.string :nombre
      t.string :slug
      t.timestamps
    end
  end
end
