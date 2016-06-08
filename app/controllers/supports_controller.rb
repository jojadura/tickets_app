class SupportsController < ApplicationController

  def index
    @supports = Support.all.order("created_at DESC")
  end

  def new
    @support = Support.new
  end

  def create
    @support = Support.new(support_params)
    @support.user = current_user
    if @support.save
      redirect_to supports_path, notice: "El Post fue creado exitosamente."
    else
      render :new   # se ubica de nuevo en la vista que se indique
    end		
  end

  def subcategories
    @sub_categories = SubCategory.where(category_id = params[:category_id])
  end  

  private 
    def support_params
      params.require(:support).permit(:titulo, :cuerpo)		
    end

end
