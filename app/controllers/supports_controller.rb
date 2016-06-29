class SupportsController < ApplicationController
  before_action :set_info, only: [:new, :create]
  before_action :set_support, only: [:show, :close]
  def index
    @supports = current_user.supports.search(params[:search]).order("created_at DESC").page(params[:page]).per(10)
  end

  def new
    @support = Support.new
  end
  
  def show
  end

  def create
    @support = Support.new(support_params)
    @support.user_id = current_user.id
    if @support.save
      redirect_to supports_path, notice: "El Post fue creado exitosamente."
    else
     render 'new'
    end		
  end

  def close
    @support.close
    redirect_to supports_path, notice: "El ticket fue cerrado exitosamente."
  end


  def subcategories
    @sub_categories = SubCategory.where(category_id = params[:category_id])
  end  

  def set_info
     @categorias = Category.all.order(:title)
     @sub_categorias = SubCategory.all.order(:name)
     @prioridades=Priority.all
  end

  private 
    def support_params
      params.require(:support).permit(:state_id,:title, :sub_categories_id, :description, :priority_id, :screen)		
    end
   
   def set_support
      @support = Support.find(params[:id])
    end
end
