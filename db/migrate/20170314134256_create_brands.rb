class CreateBrands < ActiveRecord::Migration[5.0]
  def change
    create_table :brands do |t|
      t.string :nombre
      t.string :slug

      t.timestamps
    end
  end
end
