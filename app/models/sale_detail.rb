class SaleDetail < ApplicationRecord
	belongs_to :sale
	belongs_to :item

	validates :item_id, presence: true
	validates :qty, presence: true
	validates :precio, presence: true

	accepts_nested_attributes_for :item


	def subtotal
		self.qty ? qty * unit_precio : 0
	end

	def unit_precio
		if persisted?
			precio
		else
			item ? item.precio : 0
		end
	end
end