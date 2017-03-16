class CreateSales < ActiveRecord::Migration[5.0]
  def change
    create_table :sales do |t|
      t.integer :number
      t.date :date
      t.integer :state
      t.integer :user_id
      t.references :cliente, foreign_key: true
      t.string   :slug
      
      t.timestamps
    end
  end
end
