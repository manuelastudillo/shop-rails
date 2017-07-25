class SaleDetail < ApplicationRecord
	belongs_to :sale
	belongs_to :item

	validates :item_id, presence: true
	validates :qty, length: {in: 1..2, message: "Cantidad entre 1 y 99"}
	validates :qty, presence: true
	validates :price, presence: true

    validate :custom_validation_function
	
	accepts_nested_attributes_for :item


	def subtotal
		self.qty ? qty * unit_price : 0
	end

	def unit_price
		if persisted?
			price
		else
			item ? item.price : 0
		end
	end

def custom_validation_function
	 errors.add :qty, "Cantidad mínima 1" if self.qty == 0 || self.qty.to_s.include?("-")
  if self.qty >= item.stock
      errors.add(:vendidos, "no puede ser mayor que cantidad")
      return false
  end
end

end