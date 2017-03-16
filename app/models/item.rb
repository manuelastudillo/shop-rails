class Item < ApplicationRecord
  belongs_to :brand
  belongs_to :unit
  belongs_to :category
  belongs_to :proveedor

 validates :description, presence: true

 def item_description
  self.description + ( (self.brand != nil) ? ' ' + self.brand.name : '' )
 end

 def brand_name
  if self.brand
   self.brand.name
  else
   ''
  end
 end
end