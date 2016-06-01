module CategoriesHelper
	def form_title(model)
		model.new_record? ? "Crear Categoría" : "Editar Categoría"
	end
end
