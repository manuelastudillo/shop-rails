class ChangeTypeProveedor < ActiveRecord::Migration[5.0]
  

  def up

  	change_table :proveedors do |t|
  		t.change :email, :string
  	end
  end


  	def down
  		change_table :proveedors do |t|
  			t.change :email, :integer
  		end
  end
end
