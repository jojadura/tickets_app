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

#  def show
#   @category = Category.find(params[:id])    
#  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
      @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to categories_path, notice: "La Categoría fue modificada exitosamente."
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to categories_path, notice: "La Categoría fue eliminada exitosamente."
  end


  private 
    def category_params
      params.require(:category).permit(:title, :description)		
    end

end
