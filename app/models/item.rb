class Item < ApplicationRecord
  belongs_to :brand
  belongs_to :unit
  belongs_to :category
  belongs_to :proveedor

/ validate :barcode_positivo /
 validates :description, presence: true
 validates_uniqueness_of :description, :message => 'Ya está registrado'
 /validates :code, presence: true/
 validate :custom_validation_function 

 validates :stock, presence: true
 validates :stock, numericality: { only_integer: true, message: "solo se permiten números enteros"}
 validates :stock, numericality: {:greater_than_or_equal_to => 0, message: "no se permiten números negativos"}
 validates :stock, length: { in: 1..7, message: "la cantidad debe tener entre 1 y 7 caracteres"}

 validates :min_stock, presence: true
 validates :min_stock, numericality: { only_integer: true, message: "solo se permiten números enteros"}
 validates :min_stock, numericality: {:greater_than_or_equal_to => 0, message: "no se permiten números negativos"}
 validates :min_stock, length: { in: 1..7, message: "la cantidad debe tener entre 1 y 7 caracteres"}

 validates :price, numericality: { :greater_than_or_equal_to => 0, message: "no se permiten números negativos"}
 validates :price, numericality: {only_integer: true, message: "solo se permiten números enteros"}, length: {minimum: 3, maximum: 6, :message => "El precio debe tener entre 3 y 6 caracteres"}
validate :price_mayor
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

def item_not_registered
  errors.add :name, 'ya está registrado' if Item.find_by_name(name)
end

  def barcode_positivo
    errors.add :code, 'Ingrese sólo números' if self.code.to_s.include?("-")
end


 def custom_validation_function
  if self.min_stock > self.stock
      errors.add(:min_stock, "no puede ser mayor que Stock")
      return false
  end
end

  def price_mayor
    errors.add :price, "Precio mínimo $1" if self.price == 0 || self.price.to_s.include?("-")
end

end
