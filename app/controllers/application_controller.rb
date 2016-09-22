class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

 before_action :configure_devise_permitted_parameters, if: :devise_controller?

 helper_method :user_admin?,:user_usuario?

  protected
  def user_admin?
   redirect_to supports_path , notice: "No tiene permisos" unless current_user.admin?
  end
  def user_usuario?
   redirect_to assistance_index_path , notice: "No tiene permisos" unless current_user.usuario?
  end  
  def configure_devise_permitted_parameters
    registration_params = [:name, :email, :password, :password_confirmation]

    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) { 
        |u| u.permit(registration_params << :current_password)
      }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) { 
        |u| u.permit(registration_params) 
      }
    end
  end

   def after_sign_in_path_for(resource)
     if current_user.role.name == "Usuario"
      supports_path
    elsif current_user.role.name == "Administrador" 
      flash.now[:notice] = 'Logueado como Super Admin'
      assistance_index_path
     end

   end 
end
