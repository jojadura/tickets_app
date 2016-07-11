class SupportsController < ApplicationController
  before_action :set_info, only: [:new, :create]
  before_action :set_support, only: [:show, :close,:update]
  def index
   #  unless request.xhr?
   #    session[:page] = params[:page]
       @supports = current_user.supports.search(params[:search]).order("created_at DESC").page(params[:page]).per(10)
    # else 
    #  params.to_yaml
    #   @supports = current_user.supports.search(params[:search]).order("created_at DESC").page(session[:page]).per(10)
    # end
  end

  def new
    @support = Support.new
  end
  
  def show
    @comment= Comment.new({read:true,user_id:current_user.id,support_id:@support.id})
    if request.post?
      @comment.assign_attributes(comment_params)
     
      if @comment.save
        redirect_to support_path(@support), method: :show, notice: 'State was successfully created.'
      else
        render :show
      end
    end
  end

  def create
    @support = Support.new(support_params)
    @support.user_id= current_user.id
    if @support.save
      redirect_to supports_path, notice: "El Post fue creado exitosamente."
    else
     render 'new'
    end		
  end

  def update
    respond_to do |format|
      
      if @support.update(support_params)
        format.html { redirect_to support_path, notice: 'Priority was successfully updated.' }
        format.json { render :show, status: :ok, location: @support }
      else
        format.html { render :edit }
        format.json { render json: @support.errors, status: :unprocessable_entity }
      end
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
      params.require(:support).permit(:user_id ,:state_id,:title, :sub_categories_id, :description, :priority_id, :screen, comments_attributes:[:note,:user_id,:read])		
    end

    def comment_params
      params.require(:comment).permit(:note)    
    end 

    def set_support
      @support = Support.find(params[:id])
    end
end
