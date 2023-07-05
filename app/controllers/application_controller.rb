class ApplicationController < ActionController::Base
  # アプリケーションを完成させよう2 / 21章/ バリデーションを設定する
  before_action :authenticate_user!, except: [:top]
  # アプリケーションを完成させよう2 / 6章/ ページを表示させる
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  helper_method :current_user

  # アプリケーションを完成させよう2 / 7章/ after_sign_in_path_for
  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
