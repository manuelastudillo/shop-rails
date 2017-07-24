class SalePdf < Prawn::Document

	def initialize(sales)
		super( top_margin: 70)
		@sales = sales
		sale_nombre
		sale_id
	end

    def sale_nombre
    	text "Ventas", size: 30, style: :bold
    end
	def sale_id
		move_down 20
		table sale_id_all  do
			row(0).font_style = :bold
			columns(1..3).align = :right
			self.row_colors = ["DDDDDD","FFFFFF"]
			self.header = true
	end
  end

    def sale_id_all
    	[["Id","numero","Vendedor","Total","Fecha de Alta","Fecha de Modificación"]] +
    	@sales.map do |sale|

    		[sale.id,sale.number,sale.user.nombre,sale.total,sale.created_at.strftime("%d/%m/%Y"),sale.updated_at.strftime("%d/%m/%Y")]
    	end
    end
end
