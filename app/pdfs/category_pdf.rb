class CategoryPdf < Prawn::Document

	def initialize(categories)
		super( top_margin: 70)
		@categories = categories
		category_nombre
		category_id
	end

    def category_nombre
    	text "Categorias", size: 30, style: :bold
    end
	def category_id
		move_down 20
		table category_id_all  do
			row(0).font_style = :bold
			columns(1..3).align = :right
			self.row_colors = ["DDDDDD","FFFFFF"]
			self.header = true
	end
  end

    def category_id_all
    	[["Id","Nombre","Fecha de Alta","Fecha de Modificación"]] +
    	@categories.map do |category|
    		[category.id,category.name,category.created_at.strftime("%d/%m/%Y"),category.updated_at.strftime("%d/%m/%Y")]
    	end
    end
end
