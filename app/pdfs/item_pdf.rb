class ItemPdf < Prawn::Document

	def initialize(items)
		super( top_margin: 70)
		@items = items
		item_nombre
		item_id
	end

    def item_nombre
    	text "Items", size: 30, style: :bold
    end
	def item_id
		move_down 20
		table item_id_all  do
			row(0).font_style = :bold
			columns(1..3).align = :right
			self.row_colors = ["DDDDDD","FFFFFF"]
			self.header = true
	end
  end

    def item_id_all
    	[["Id","Nombre","Stock","Stock Minimo","Precio","Fecha de Alta","Fecha de Modificación"]] +
    	@items.map do |item|
    		[item.id,item.description,item.stock,item.min_stock,item.price,item.created_at.strftime("%d/%m/%Y"),item.updated_at.strftime("%d/%m/%Y")]
    	end
    end
end