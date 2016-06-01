module SubcategoriesHelper
	def form_title_sub
		@subcategory.new_record? ? "Crear Sub-Categoría" : "Editar Sub-Categoría"		
	end			
end
