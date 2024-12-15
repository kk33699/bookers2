class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(resource)
    flash[:notice] = "Signed in successfully.（ログインが成功しました）"
    user_path(resource)
  end
  

  def after_sign_up_path_for(resource)
    flash[:notice] = "Welcome! You have signed up successfully.（新規登録が完了しました）"
    user_path(resource)
  end

  protected
  

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
