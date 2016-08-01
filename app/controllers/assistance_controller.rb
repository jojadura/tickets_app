class AssistanceController < ApplicationController
before_action :user_admin?
before_action :set_support, only: [:show,:pre_close]
  def index
  	 @supports = Support.all_order params[:search], params[:page], 20
  end

  def close
  end

  def show
    @support.pending if @support.state.name == Rails.application.secrets.abierto 
    @comment= Comment.new({read:true,user_id:current_user.id,support_id:@support.id})
    if request.post?
      @comment.assign_attributes(comment_params)
     
      if @comment.save
        redirect_to assistance_path(@support), method: :show, notice: 'State was successfully created.'
      else
        render :show
      end
    end
  end

  def pre_close
    @support.pre_close  
    redirect_to assistance_index_path, notice: "El ticket fue cerrado exitosamente."
  end
  private 
   
    def set_support
      @support = Support.find(params[:id])
    end  
    def comment_params
      params.require(:comment).permit(:note)    
    end      
end
