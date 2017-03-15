class ValidateSuggestedBrandController < ApplicationController
  def index
  		brand = []
		if params[:brand_nombre].present?
			brand_nombre = params[:brand_nombre]
			condition = "unaccent(lower(nombre)) = '#{I18n.transliterate(brand_nombre.downcase)}'"
			brand = Brand.where(condition)
		end
		if !brand.empty?
			result = [valid: true, id: brand.ids]
		else
			result = [valid: false, id: 0]
		end
		render json: result
  end
end
