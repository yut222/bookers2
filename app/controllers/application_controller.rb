class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top]

  protect_from_forgery
  before_action :configure_permitted_parameters, if: :devise_controller?

  #サインイン後の遷移先設定
  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

  #サインアウト後の遷移先設定
  def after_sign_out_path_for(resource)
    root_path
  end

  protected  #protectedは呼び出された他のコントローラからも参照することができ

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end

end
