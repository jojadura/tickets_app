class SubcategoriesController < ApplicationController

  def index
  	@subcategory = SubCategory.all.order("created_at DESC");
  end

  def new
    @subcategory = SubCategory.new
  end

  def create
    @subcategory = SubCategory.new(subcategory_params)
    @subcategory.user = current_user
    if @subcategory.save
      redirect_to subcategories_path, notice: "La Sub-Categoría fue creada exitosamente."
    else
      render :new
    end		
  end

  private 
    def subcategory_params
      params.require(:subcategory).permit(:title, :category_id)		
    end
end
