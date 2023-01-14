class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  #サインイン後の遷移先設定
  def after_sign_in_path_for(resource)
    new_user_registration_path
  end

  #サインアウト後の遷移先設定
  def after_sign_out_path_for(resource)
    root_path
  end

  protected  #protectedは呼び出された他のコントローラからも参照することができ

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
