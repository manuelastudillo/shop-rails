class Comuna < ApplicationRecord
  belongs_to :provincia
  	 has_many :proveedor
 
end
