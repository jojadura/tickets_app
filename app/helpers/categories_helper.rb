module CategoriesHelper
	def form_title
		@category.new_record? ? "Crear Categoría" : "Editar Categoría"		
	end		
end
