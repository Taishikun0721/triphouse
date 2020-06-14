class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :show_user_icon

  def show_user_icon
    @user = User.find(current_user.id)
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:account_update, keys: %i[avator])
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[avator])
    end
end
