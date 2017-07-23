class ChangeTypeItems < ActiveRecord::Migration[5.0]
  
  def up
  	change_table :items do |t|
      t.change :stock, :integer, :default =>0
      t.change :min_stock, :integer, :default =>0
      t.change :price , :integer, :default =>0

        end
     end

      def down
	change_table :items do |t|
      t.change :stock, :integer
      t.change :min_stock, :integer
      t.change :price , :integer
       end
     end
 end