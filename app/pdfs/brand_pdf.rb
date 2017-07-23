class BrandPdf < Prawn::Document

	def initialize(brands)
		super( top_margin: 70)
		@brands = brands
		brand_nombre
		brand_id
	end

    def brand_nombre
    	text "Marcas", size: 30, style: :bold
    end
	def brand_id
		move_down 20
		table brand_id_all  do
			row(0).font_style = :bold
			columns(1..3).align = :right
			self.row_colors = ["DDDDDD","FFFFFF"]
			self.header = true
	end
  end

    def brand_id_all
    	[["Id","Nombre","Fecha de Alta","Fecha de Modificación"]] +
    	@brands.map do |brand|
    		[brand.id,brand.name,brand.created_at.strftime("%d/%m/%Y"),brand.updated_at.strftime("%d/%m/%Y")]
    	end
    end
end
