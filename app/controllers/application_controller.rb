class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end


  def after_sign_out_path_for(resource)
    root_path # ログアウト後に遷移するpathを設定
  end

 def require_login!
 if session[:user_mail].nil?
 redirect_to login_path
 end
 end
 before_action :authenticate_user!,except: [:top,:about]

 add_flash_types :success, :info, :warning, :danger


  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  before_action :set_current_user
  protect_from_forgery

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,keys:[:name,:email])
  end

  def set_current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end




end
