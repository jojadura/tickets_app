module SupportsHelper
	def form_title
		@support.new_record? ? "Crear Soporte" : "Editar Soporte"		
	end		
end
