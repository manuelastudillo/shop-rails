class CreateUnits < ActiveRecord::Migration[5.0]
  def change
    create_table :units do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
