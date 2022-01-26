class ApplicationController < ActionController::Base
  # around_action :switch_locale
  before_action :authenticate_user!
  # def switch_locale(&action_name)
  #   locale = params[:locale] || I18n.default_locale
  #   I18n.with_locale(locale, &action_name)
  # end

 before_action :configure_permitted_parameters, if: :devise_controller?

  # # # このアクションを追加
  # def after_sign_in_path_for(resource)
  #   "/user/#{current_user.id}"
  # end

  # # protected

  # # 入力フォームからアカウント名情報をDBに保存するために追加
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
