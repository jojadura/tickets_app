class CategoriesController < ApplicationController
  def index
  	@categories = Category.all.order("created_at DESC");
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user = current_user
    if @category.save
      redirect_to categories_path, notice: "La Categoría fue creada exitosamente."
    else
      render :new
    end		
  end

  private 
    def category_params
      params.require(:category).permit(:title, :description)		
    end

end
