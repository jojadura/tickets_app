module CategoriesHelper
	def form_title(model)
		#model.new_record? ? "Crear Categoría" : "Editar Categoría"
		model.new_record? ? "Crear #{model.class}" : "Editar #{model.class}"
	end		
end
