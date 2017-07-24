class UserPdf < Prawn::Document

	def initialize(users)
		super( top_margin: 70)
		@users = users
		user_nombre
		user_id
	end

    def user_nombre
    	text "Usuarios", size: 30, style: :bold
    end
	def user_id
		move_down 20
		table user_id_all  do
			row(0).font_style = :bold
			columns(1..3).align = :right
			self.row_colors = ["DDDDDD","FFFFFF"]
			self.header = true
	end
  end

    def user_id_all
    	[["Id","Nombre","rut","email","Fecha de Alta","Fecha de Modificación"]] +
    	@users.map do |user|
    		[user.id,user.nombre,user.rut,user.email,user.created_at.strftime("%d/%m/%Y"),user.updated_at.strftime("%d/%m/%Y")]
    	end
    end
end
