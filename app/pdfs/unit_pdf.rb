class UnitPdf < Prawn::Document

	def initialize(units)
		super( top_margin: 70)
		@units = units
		unit_nombre
		unit_id
	end

    def unit_nombre
    	text "Marcas", size: 30, style: :bold
    end
	def unit_id
		move_down 20
		table unit_id_all  do
			row(0).font_style = :bold
			columns(1..3).align = :right
			self.row_colors = ["DDDDDD","FFFFFF"]
			self.header = true
	end
  end

    def unit_id_all
    	[["Id","Nombre","Fecha de Alta","Fecha de Modificación"]] +
    	@units.map do |unit|
    		[unit.id,unit.name,unit.created_at.strftime("%d/%m/%Y"),unit.updated_at.strftime("%d/%m/%Y")]
    	end
    end
end