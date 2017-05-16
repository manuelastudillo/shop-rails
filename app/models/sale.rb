class Sale < ApplicationRecord
	has_many :sale_details, inverse_of: :sale, dependent: :destroy
	has_many :items, through: :sale_details
	belongs_to :user
    
    belongs_to :cliente
	validates :number, presence: true
	validates :date, presence: true
validate :fecha_de_vencimiento_no_puede_estar_en_el_pasado


	accepts_nested_attributes_for :sale_details, reject_if: :sale_detail_rejectable?,
									allow_destroy: true

	enum state: [:draft, :confirmed]


def fecha_de_vencimiento_no_puede_estar_en_el_pasado
	if date.blank? and date < Date.today
		errors.add(:date, "ingresaste una fecha que paso")
end




	def total
		details = self.sale_details

		total = 0.0
		details.flat_map do |d|
			total += d.qty * d.price
		end
		total
	end


	private

		def sale_detail_rejectable?(att)
			att[:item_id].blank? || att[:qty].blank? || att[:price].blank? || att[:qty].to_f <= 0 || att[:price].to_f <= 0
		end
end