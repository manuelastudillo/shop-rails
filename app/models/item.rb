class Item < ApplicationRecord
  belongs_to :brand
  belongs_to :unit
  belongs_to :category
  belongs_to :proveedor


 validates :descripcion, presence: true

 def item_descripcion
  self.descripcion + ( (self.brand != nil) ? ' ' + self.brand.nombre : '' )
 end

 def brand_nombre
  if self.brand
   self.brand.nombre
  else
   ''

 end
end
end
