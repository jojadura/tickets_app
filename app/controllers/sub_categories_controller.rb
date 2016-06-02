class SubCategoriesController < ApplicationController

  def index
  	@subcategories = SubCategory.all.order("created_at DESC");
  end

  def new
    @subcategory = SubCategory.new
  end

  def create
    @subcategory = SubCategory.new(subcategory_params)
    @subcategory.user = current_user
    if @subcategory.save
      redirect_to sub_categories_path, notice: "La Sub-Categoría fue creada exitosamente."
    else
      render :new
    end		
  end

  private 
    def subcategory_params
      params.require(:sub_category).permit(:name, :category_id)
    end
end
