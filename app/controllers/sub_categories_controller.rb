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

  def edit
    @subcategory = SubCategory.find(params[:id])
  end

  def update
      @subcategory = SubCategory.find(params[:id])
    if @subcategory.update(subcategory_params)
      redirect_to sub_categories_path, notice: "La Categoría fue modificada exitosamente."
    else
      render :edit
    end
  end

  def destroy
    @subcategory = SubCategory.find(params[:id])
    @subcategory.destroy

    redirect_to sub_categories_path, notice: "La Categoría fue eliminada exitosamente."
  end
  
  private 
    def subcategory_params
      params.require(:sub_category).permit(:name, :category_id)
    end
end
